; DESCRIPTION: Composite: Renders a black box of size 70x97 starting at (282, 85) then Places a white dot at position (234, 247).
; PLAN: r0=282(x), r1=85(y), r2=70(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=247(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 85
LDI r2, 70
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 247
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
