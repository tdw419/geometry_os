; DESCRIPTION: Composite: Sets a single black pixel at (270, 156) then Renders a magenta box of size 102x46 starting at (270, 179).
; PLAN: r0=270(x), r1=156(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=179(y), r7=102(width), r8=46(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 156
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 270
LDI r6, 179
LDI r7, 102
LDI r8, 46
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
