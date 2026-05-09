; DESCRIPTION: Composite: Sets a single blue pixel at (61, 136) then Places a green 35x39 rectangle at position (162, 106).
; PLAN: r0=61(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=106(y), r7=35(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 106
LDI r7, 35
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
