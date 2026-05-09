; DESCRIPTION: Composite: Places a white dot at position (136, 58) then Places a magenta 99x64 rectangle at position (159, 17) then Draws a green line from (262, 207) to (280, 163).
; PLAN: r0=136(x), r1=58(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=17(y), r7=99(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x1), r11=207(y1), r12=280(x2), r13=163(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 58
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 17
LDI r7, 99
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 207
LDI r12, 280
LDI r13, 163
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
