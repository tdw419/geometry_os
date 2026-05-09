; DESCRIPTION: Composite: Places a black line segment connecting (401, 126) to (30, 8) then Places a purple circle of radius 46 at center (71, 159).
; PLAN: r0=401(x1), r1=126(y1), r2=30(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=159(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 126
LDI r2, 30
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 159
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
