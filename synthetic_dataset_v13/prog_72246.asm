; DESCRIPTION: Composite: Sets a single blue pixel at (390, 212) then Renders a blue box of size 81x27 starting at (259, 148).
; PLAN: r0=390(x), r1=212(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=148(y), r7=81(width), r8=27(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 212
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 148
LDI r7, 81
LDI r8, 27
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
