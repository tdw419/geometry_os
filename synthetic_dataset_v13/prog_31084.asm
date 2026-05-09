; DESCRIPTION: Composite: Draws a red rectangle at (73, 145) with width 78 and height 90 then Sets a single cyan pixel at (297, 246).
; PLAN: r0=73(x), r1=145(y), r2=78(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=246(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 145
LDI r2, 78
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 246
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
