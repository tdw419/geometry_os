; DESCRIPTION: Composite: Places a purple 75x14 rectangle at position (267, 106) then Places a orange dot at position (232, 10).
; PLAN: r0=267(x), r1=106(y), r2=75(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x), r6=10(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 267
LDI r1, 106
LDI r2, 75
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 10
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
