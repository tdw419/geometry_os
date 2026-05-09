; DESCRIPTION: Composite: Renders a purple box of size 90x105 starting at (287, 100) then Places a white dot at position (254, 217).
; PLAN: r0=287(x), r1=100(y), r2=90(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=217(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 100
LDI r2, 90
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 217
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
