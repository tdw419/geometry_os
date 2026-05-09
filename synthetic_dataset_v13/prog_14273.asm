; DESCRIPTION: Composite: Places a white line segment connecting (106, 23) to (409, 41) then Places a purple circle of radius 40 at center (450, 126).
; PLAN: r0=106(x1), r1=23(y1), r2=409(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=126(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 23
LDI r2, 409
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 126
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
