; DESCRIPTION: Composite: Sets a single yellow pixel at (96, 145) then Draws a yellow rectangle at (228, 87) with width 85 and height 35.
; PLAN: r0=96(x), r1=145(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=87(y), r7=85(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 145
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 228
LDI r6, 87
LDI r7, 85
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
