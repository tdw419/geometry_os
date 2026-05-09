; DESCRIPTION: Composite: Places a magenta dot at position (341, 76) then Draws a purple line from (288, 84) to (455, 199) then Places a green 17x17 rectangle at position (304, 146).
; PLAN: r0=341(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=288(x1), r6=84(y1), r7=455(x2), r8=199(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=146(y), r12=17(width), r13=17(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 84
LDI r7, 455
LDI r8, 199
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 146
LDI r12, 17
LDI r13, 17
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
