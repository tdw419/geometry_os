; DESCRIPTION: Composite: Sets a single magenta pixel at (152, 205) then Draws a magenta rectangle at (425, 19) with width 40 and height 116.
; PLAN: r0=152(x), r1=205(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=19(y), r7=40(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 205
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 19
LDI r7, 40
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
