; DESCRIPTION: Composite: Renders a green box of size 117x106 starting at (118, 71) then Places a blue dot at position (35, 53).
; PLAN: r0=118(x), r1=71(y), r2=117(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=53(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 71
LDI r2, 117
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 53
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
