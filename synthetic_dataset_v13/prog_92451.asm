; DESCRIPTION: Composite: Renders a purple box of size 35x113 starting at (159, 66) then Places a green dot at position (184, 41).
; PLAN: r0=159(x), r1=66(y), r2=35(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=41(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 66
LDI r2, 35
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 41
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
