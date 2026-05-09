; DESCRIPTION: Composite: Renders a blue box of size 78x95 starting at (134, 93) then Places a black dot at position (261, 215).
; PLAN: r0=134(x), r1=93(y), r2=78(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=215(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 93
LDI r2, 78
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 215
LDI r7, 0x000000
PSET r5, r6, r7
HALT
