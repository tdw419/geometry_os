; DESCRIPTION: Composite: Places a red 75x41 rectangle at position (377, 89) then Creates a black circular shape at (52, 145) with radius 12.
; PLAN: r0=377(x), r1=89(y), r2=75(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=145(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 377
LDI r1, 89
LDI r2, 75
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 145
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
