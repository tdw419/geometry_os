; DESCRIPTION: Composite: Places a black 41x52 rectangle at position (94, 44) then Places a white dot at position (159, 169) then Creates a blue circular shape at (103, 25) with radius 18.
; PLAN: r0=94(x), r1=44(y), r2=41(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=169(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=25(y), r12=18(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 44
LDI r2, 41
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 169
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 25
LDI r12, 18
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
