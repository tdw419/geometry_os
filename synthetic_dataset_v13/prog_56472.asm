; DESCRIPTION: Composite: Places a green circle of radius 54 at center (418, 140) then Renders a white box of size 37x114 starting at (87, 51) then Places a yellow dot at position (472, 70).
; PLAN: r0=418(x), r1=140(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=51(y), r7=37(width), r8=114(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x), r11=70(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 140
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 51
LDI r7, 37
LDI r8, 114
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 70
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
