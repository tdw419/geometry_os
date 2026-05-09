; DESCRIPTION: Composite: Sets a single blue pixel at (142, 114) then Renders a red box of size 102x105 starting at (231, 52).
; PLAN: r0=142(x), r1=114(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=52(y), r7=102(width), r8=105(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 114
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 52
LDI r7, 102
LDI r8, 105
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
