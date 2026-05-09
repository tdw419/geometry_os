; DESCRIPTION: Composite: Places a yellow 113x23 rectangle at position (41, 20) then Places a purple dot at position (311, 179).
; PLAN: r0=41(x), r1=20(y), r2=113(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=179(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 20
LDI r2, 113
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 179
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
