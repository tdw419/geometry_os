; DESCRIPTION: Composite: Sets a single purple pixel at (313, 76) then Renders a blue box of size 118x71 starting at (49, 107).
; PLAN: r0=313(x), r1=76(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=107(y), r7=118(width), r8=71(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 76
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 107
LDI r7, 118
LDI r8, 71
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
