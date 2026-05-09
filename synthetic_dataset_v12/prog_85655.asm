; DESCRIPTION: Composite: Renders a green disk with center (254, 153) and radius 33 then Places a red line segment connecting (395, 134) to (332, 50).
; PLAN: r0=254(x), r1=153(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x1), r6=134(y1), r7=332(x2), r8=50(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 153
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 134
LDI r7, 332
LDI r8, 50
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
