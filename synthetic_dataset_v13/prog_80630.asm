; DESCRIPTION: Composite: Places a yellow dot at position (145, 248) then Draws a blue rectangle at (434, 195) with width 30 and height 61.
; PLAN: r0=145(x), r1=248(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=195(y), r7=30(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 248
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 434
LDI r6, 195
LDI r7, 30
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
