; DESCRIPTION: Composite: Draws a yellow rectangle at (145, 240) with width 17 and height 16 then Places a red dot at position (199, 184) then Places a green line segment connecting (247, 202) to (241, 17).
; PLAN: r0=145(x), r1=240(y), r2=17(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=184(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=247(x1), r11=202(y1), r12=241(x2), r13=17(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 240
LDI r2, 17
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 184
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 247
LDI r11, 202
LDI r12, 241
LDI r13, 17
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
