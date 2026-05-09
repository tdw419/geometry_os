; DESCRIPTION: Composite: Places a red dot at position (489, 105) then Draws a cyan rectangle at (160, 64) with width 10 and height 73.
; PLAN: r0=489(x), r1=105(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=64(y), r7=10(width), r8=73(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 489
LDI r1, 105
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 160
LDI r6, 64
LDI r7, 10
LDI r8, 73
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
