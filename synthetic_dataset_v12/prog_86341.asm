; DESCRIPTION: Composite: Draws a blue line from (315, 140) to (508, 234) then Draws a yellow circle centered at (87, 180) with radius 35.
; PLAN: r0=315(x1), r1=140(y1), r2=508(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=180(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 140
LDI r2, 508
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 180
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
