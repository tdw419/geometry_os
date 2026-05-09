; DESCRIPTION: Composite: Places a black circle of radius 80 at center (277, 123) then Places a white line segment connecting (143, 121) to (220, 130).
; PLAN: r0=277(x), r1=123(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x1), r6=121(y1), r7=220(x2), r8=130(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 123
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 121
LDI r7, 220
LDI r8, 130
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
