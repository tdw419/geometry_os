; DESCRIPTION: Composite: Sets a single purple pixel at (253, 2) then Renders a white box of size 59x22 starting at (37, 138).
; PLAN: r0=253(x), r1=2(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=37(x), r6=138(y), r7=59(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 2
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 37
LDI r6, 138
LDI r7, 59
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
