; DESCRIPTION: Composite: Places a purple dot at position (64, 99) then Draws a cyan rectangle at (176, 96) with width 19 and height 79.
; PLAN: r0=64(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=96(y), r7=19(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 96
LDI r7, 19
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
