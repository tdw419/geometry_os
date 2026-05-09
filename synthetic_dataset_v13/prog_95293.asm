; DESCRIPTION: Composite: Sets a single yellow pixel at (429, 120) then Draws a cyan rectangle at (200, 51) with width 26 and height 107.
; PLAN: r0=429(x), r1=120(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=51(y), r7=26(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 120
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 200
LDI r6, 51
LDI r7, 26
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
