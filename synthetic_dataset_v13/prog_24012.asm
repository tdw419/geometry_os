; DESCRIPTION: Composite: Sets a single magenta pixel at (78, 18) then Renders a magenta box of size 62x75 starting at (66, 119).
; PLAN: r0=78(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=119(y), r7=62(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 119
LDI r7, 62
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
