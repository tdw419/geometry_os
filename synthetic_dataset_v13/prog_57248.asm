; DESCRIPTION: Composite: Renders a white box of size 70x97 starting at (121, 51) then Places a magenta dot at position (374, 139).
; PLAN: r0=121(x), r1=51(y), r2=70(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=139(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 51
LDI r2, 70
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 139
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
