; DESCRIPTION: Composite: Draws a red circle centered at (110, 78) with radius 70 then Draws a blue line from (292, 207) to (125, 40).
; PLAN: r0=110(x), r1=78(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x1), r6=207(y1), r7=125(x2), r8=40(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 78
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 207
LDI r7, 125
LDI r8, 40
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
