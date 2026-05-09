; DESCRIPTION: Composite: Renders a black box of size 118x73 starting at (324, 18) then Places a white dot at position (161, 27).
; PLAN: r0=324(x), r1=18(y), r2=118(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=27(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 18
LDI r2, 118
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 27
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
