; DESCRIPTION: Composite: Places a blue 83x118 rectangle at position (377, 89) then Places a black circle of radius 41 at center (436, 154).
; PLAN: r0=377(x), r1=89(y), r2=83(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x), r6=154(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 89
LDI r2, 83
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 154
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
