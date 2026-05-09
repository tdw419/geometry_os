; DESCRIPTION: Composite: Renders a black box of size 85x117 starting at (395, 76) then Places a white dot at position (192, 105).
; PLAN: r0=395(x), r1=76(y), r2=85(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=105(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 395
LDI r1, 76
LDI r2, 85
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 105
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
