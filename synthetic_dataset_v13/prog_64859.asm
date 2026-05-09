; DESCRIPTION: Composite: Draws a red line from (80, 78) to (484, 45) then Draws a cyan circle centered at (74, 188) with radius 33.
; PLAN: r0=80(x1), r1=78(y1), r2=484(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=188(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 78
LDI r2, 484
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 188
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
