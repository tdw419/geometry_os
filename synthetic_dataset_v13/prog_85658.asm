; DESCRIPTION: Composite: Renders a blue line between points (469, 229) and (10, 59) then Creates a blue circular shape at (261, 43) with radius 42.
; PLAN: r0=469(x1), r1=229(y1), r2=10(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=43(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 469
LDI r1, 229
LDI r2, 10
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 43
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
