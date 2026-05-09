; DESCRIPTION: Composite: Sets a single white pixel at (457, 97) then Renders a magenta box of size 31x78 starting at (130, 161).
; PLAN: r0=457(x), r1=97(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=161(y), r7=31(width), r8=78(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 97
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 161
LDI r7, 31
LDI r8, 78
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
