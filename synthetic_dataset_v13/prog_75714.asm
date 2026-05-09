; DESCRIPTION: Composite: Renders a green box of size 118x107 starting at (60, 141) then Places a blue dot at position (316, 73).
; PLAN: r0=60(x), r1=141(y), r2=118(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=73(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 141
LDI r2, 118
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 73
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
