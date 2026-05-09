; DESCRIPTION: Composite: Creates a black circular shape at (379, 89) with radius 69 then Draws a black line from (28, 200) to (204, 60) then Places a white dot at position (30, 86).
; PLAN: r0=379(x), r1=89(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x1), r6=200(y1), r7=204(x2), r8=60(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=30(x), r11=86(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 379
LDI r1, 89
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 200
LDI r7, 204
LDI r8, 60
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 86
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
