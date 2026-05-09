; DESCRIPTION: Composite: Places a cyan dot at position (231, 82) then Draws a purple rectangle at (118, 106) with width 55 and height 61.
; PLAN: r0=231(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=106(y), r7=55(width), r8=61(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 106
LDI r7, 55
LDI r8, 61
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
