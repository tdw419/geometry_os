; DESCRIPTION: Composite: Places a magenta dot at position (71, 138) then Renders a white box of size 52x102 starting at (169, 35).
; PLAN: r0=71(x), r1=138(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=35(y), r7=52(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 138
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 35
LDI r7, 52
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
