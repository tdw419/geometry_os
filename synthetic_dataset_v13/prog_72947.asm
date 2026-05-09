; DESCRIPTION: Composite: Places a orange dot at position (182, 236) then Draws a white rectangle at (349, 61) with width 52 and height 96.
; PLAN: r0=182(x), r1=236(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=61(y), r7=52(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 236
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 349
LDI r6, 61
LDI r7, 52
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
