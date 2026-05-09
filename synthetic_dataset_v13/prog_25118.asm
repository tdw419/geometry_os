; DESCRIPTION: Composite: Renders a purple box of size 28x64 starting at (233, 191) then Sets a single purple pixel at (343, 24).
; PLAN: r0=233(x), r1=191(y), r2=28(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=24(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 233
LDI r1, 191
LDI r2, 28
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 24
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
