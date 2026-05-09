; DESCRIPTION: Composite: Places a green circle of radius 35 at center (358, 50) then Places a black line segment connecting (455, 26) to (437, 148).
; PLAN: r0=358(x), r1=50(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=26(y1), r7=437(x2), r8=148(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 50
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 26
LDI r7, 437
LDI r8, 148
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
