; DESCRIPTION: Composite: Places a blue dot at position (462, 236) then Draws a orange rectangle at (118, 93) with width 84 and height 120.
; PLAN: r0=462(x), r1=236(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=93(y), r7=84(width), r8=120(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 236
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 93
LDI r7, 84
LDI r8, 120
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
