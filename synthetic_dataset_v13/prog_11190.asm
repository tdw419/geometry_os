; DESCRIPTION: Composite: Places a green 11x94 rectangle at position (445, 55) then Creates a green circular shape at (449, 100) with radius 41.
; PLAN: r0=445(x), r1=55(y), r2=11(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x), r6=100(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 55
LDI r2, 11
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 100
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
