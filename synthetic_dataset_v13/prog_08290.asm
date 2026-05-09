; DESCRIPTION: Composite: Sets a single magenta pixel at (264, 227) then Renders a white box of size 73x119 starting at (138, 120).
; PLAN: r0=264(x), r1=227(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=120(y), r7=73(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 227
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 138
LDI r6, 120
LDI r7, 73
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
