; DESCRIPTION: Composite: Places a black circle of radius 37 at center (440, 105) then Places a black line segment connecting (331, 114) to (231, 49).
; PLAN: r0=440(x), r1=105(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=114(y1), r7=231(x2), r8=49(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 105
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 114
LDI r7, 231
LDI r8, 49
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
