; DESCRIPTION: Composite: Places a red dot at position (358, 79) then Draws a orange rectangle at (228, 162) with width 23 and height 35.
; PLAN: r0=358(x), r1=79(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=162(y), r7=23(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 79
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 228
LDI r6, 162
LDI r7, 23
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
