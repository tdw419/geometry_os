; DESCRIPTION: Composite: Places a green 49x53 rectangle at position (100, 113) then Places a orange dot at position (427, 184).
; PLAN: r0=100(x), r1=113(y), r2=49(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=184(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 113
LDI r2, 49
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 184
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
