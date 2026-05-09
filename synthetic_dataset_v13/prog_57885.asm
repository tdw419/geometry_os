; DESCRIPTION: Composite: Draws a green circle centered at (252, 124) with radius 70 then Draws a black line from (442, 50) to (395, 20).
; PLAN: r0=252(x), r1=124(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x1), r6=50(y1), r7=395(x2), r8=20(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 124
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 50
LDI r7, 395
LDI r8, 20
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
