; DESCRIPTION: Composite: Places a black circle of radius 62 at center (76, 177) then Places a magenta line segment connecting (478, 24) to (49, 125).
; PLAN: r0=76(x), r1=177(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=24(y1), r7=49(x2), r8=125(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 177
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 24
LDI r7, 49
LDI r8, 125
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
