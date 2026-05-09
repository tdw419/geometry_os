; DESCRIPTION: Composite: Sets a single blue pixel at (212, 227) then Renders a white box of size 95x112 starting at (51, 121).
; PLAN: r0=212(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=121(y), r7=95(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 227
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 51
LDI r6, 121
LDI r7, 95
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
