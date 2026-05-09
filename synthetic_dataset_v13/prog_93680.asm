; DESCRIPTION: Composite: Renders a orange box of size 53x23 starting at (249, 132) then Places a purple dot at position (458, 121).
; PLAN: r0=249(x), r1=132(y), r2=53(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=121(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 132
LDI r2, 53
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 121
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
