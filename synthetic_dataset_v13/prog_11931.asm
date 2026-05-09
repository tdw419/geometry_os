; DESCRIPTION: Composite: Renders a black box of size 93x12 starting at (179, 179) then Places a red dot at position (150, 205).
; PLAN: r0=179(x), r1=179(y), r2=93(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=205(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 179
LDI r2, 93
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 205
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
