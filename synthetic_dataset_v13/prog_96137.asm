; DESCRIPTION: Composite: Renders a blue box of size 64x93 starting at (47, 10) then Places a cyan dot at position (93, 41) then Places a white line segment connecting (449, 102) to (396, 124).
; PLAN: r0=47(x), r1=10(y), r2=64(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=449(x1), r11=102(y1), r12=396(x2), r13=124(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 10
LDI r2, 64
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 449
LDI r11, 102
LDI r12, 396
LDI r13, 124
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
