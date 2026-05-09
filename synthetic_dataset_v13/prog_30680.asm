; DESCRIPTION: Composite: Sets a single blue pixel at (274, 169) then Draws a cyan rectangle at (187, 79) with width 27 and height 109.
; PLAN: r0=274(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=79(y), r7=27(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 169
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 79
LDI r7, 27
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
