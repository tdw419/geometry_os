; DESCRIPTION: Composite: Places a yellow circle of radius 37 at center (464, 61) then Places a green line segment connecting (230, 101) to (87, 183).
; PLAN: r0=464(x), r1=61(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x1), r6=101(y1), r7=87(x2), r8=183(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 61
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 101
LDI r7, 87
LDI r8, 183
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
