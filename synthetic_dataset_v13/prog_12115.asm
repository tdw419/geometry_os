; DESCRIPTION: Composite: Renders a black box of size 79x51 starting at (297, 2) then Sets a single magenta pixel at (193, 151).
; PLAN: r0=297(x), r1=2(y), r2=79(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=151(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 2
LDI r2, 79
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 151
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
