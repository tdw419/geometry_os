; DESCRIPTION: Composite: Sets a single black pixel at (453, 48) then Renders a blue box of size 88x49 starting at (2, 74).
; PLAN: r0=453(x), r1=48(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=2(x), r6=74(y), r7=88(width), r8=49(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 48
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 2
LDI r6, 74
LDI r7, 88
LDI r8, 49
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
