; DESCRIPTION: Composite: Renders a black box of size 110x44 starting at (143, 189) then Sets a single blue pixel at (51, 117).
; PLAN: r0=143(x), r1=189(y), r2=110(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=117(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 189
LDI r2, 110
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 117
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
