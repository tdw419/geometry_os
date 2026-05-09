; DESCRIPTION: Composite: Renders a purple box of size 115x91 starting at (129, 38) then Sets a single purple pixel at (190, 119).
; PLAN: r0=129(x), r1=38(y), r2=115(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=119(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 38
LDI r2, 115
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 119
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
