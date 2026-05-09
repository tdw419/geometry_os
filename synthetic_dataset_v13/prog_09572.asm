; DESCRIPTION: Composite: Draws a green circle centered at (228, 119) with radius 31 then Renders a black line between points (123, 75) and (485, 123).
; PLAN: r0=228(x), r1=119(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x1), r6=75(y1), r7=485(x2), r8=123(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 119
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 75
LDI r7, 485
LDI r8, 123
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
