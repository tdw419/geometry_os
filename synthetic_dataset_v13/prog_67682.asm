; DESCRIPTION: Composite: Sets a single purple pixel at (139, 18) then Renders a magenta box of size 40x58 starting at (204, 74).
; PLAN: r0=139(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=204(x), r6=74(y), r7=40(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 18
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 74
LDI r7, 40
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
