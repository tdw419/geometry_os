; DESCRIPTION: Composite: Renders a purple box of size 89x118 starting at (1, 134) then Sets a single cyan pixel at (190, 112).
; PLAN: r0=1(x), r1=134(y), r2=89(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=112(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 1
LDI r1, 134
LDI r2, 89
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 112
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
