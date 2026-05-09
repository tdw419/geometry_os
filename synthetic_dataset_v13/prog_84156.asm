; DESCRIPTION: Composite: Places a orange 22x41 rectangle at position (73, 79) then Places a blue dot at position (329, 53).
; PLAN: r0=73(x), r1=79(y), r2=22(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=53(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 79
LDI r2, 22
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 53
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
