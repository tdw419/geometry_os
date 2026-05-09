; DESCRIPTION: Composite: Sets a single purple pixel at (96, 80) then Renders a black box of size 29x98 starting at (30, 75).
; PLAN: r0=96(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=75(y), r7=29(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 80
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 75
LDI r7, 29
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
