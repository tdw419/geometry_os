; DESCRIPTION: Composite: Places a black line segment connecting (88, 10) to (466, 70) then Creates a green circular shape at (349, 120) with radius 65.
; PLAN: r0=88(x1), r1=10(y1), r2=466(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=120(y), r7=65(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 88
LDI r1, 10
LDI r2, 466
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 120
LDI r7, 65
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
