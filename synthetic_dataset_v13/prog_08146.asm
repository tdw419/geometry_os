; DESCRIPTION: Composite: Places a white dot at position (144, 183) then Renders a magenta box of size 11x107 starting at (39, 33).
; PLAN: r0=144(x), r1=183(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=39(x), r6=33(y), r7=11(width), r8=107(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 183
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 39
LDI r6, 33
LDI r7, 11
LDI r8, 107
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
