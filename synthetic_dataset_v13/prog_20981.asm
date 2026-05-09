; DESCRIPTION: Composite: Creates a orange circular shape at (120, 48) with radius 22 then Places a red dot at position (363, 15) then Places a purple line segment connecting (59, 81) to (188, 214).
; PLAN: r0=120(x), r1=48(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=15(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=59(x1), r11=81(y1), r12=188(x2), r13=214(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 48
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 15
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 59
LDI r11, 81
LDI r12, 188
LDI r13, 214
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
