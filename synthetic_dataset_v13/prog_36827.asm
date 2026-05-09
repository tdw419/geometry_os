; DESCRIPTION: Composite: Sets a single green pixel at (288, 106) then Places a magenta 98x25 rectangle at position (327, 159).
; PLAN: r0=288(x), r1=106(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=159(y), r7=98(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 106
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 159
LDI r7, 98
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
