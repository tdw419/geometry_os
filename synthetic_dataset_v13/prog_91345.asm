; DESCRIPTION: Composite: Sets a single magenta pixel at (77, 228) then Draws a orange rectangle at (209, 27) with width 81 and height 97.
; PLAN: r0=77(x), r1=228(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=27(y), r7=81(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 228
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 27
LDI r7, 81
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
