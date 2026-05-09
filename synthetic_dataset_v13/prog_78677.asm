; DESCRIPTION: Composite: Renders a white box of size 43x61 starting at (466, 89) then Places a black dot at position (505, 229).
; PLAN: r0=466(x), r1=89(y), r2=43(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=505(x), r6=229(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 466
LDI r1, 89
LDI r2, 43
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 229
LDI r7, 0x000000
PSET r5, r6, r7
HALT
