; DESCRIPTION: Composite: Creates a blue rectangular region at (211, 71) spanning 51 by 81 pixels then Sets a single purple pixel at (308, 50).
; PLAN: r0=211(x), r1=71(y), r2=51(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=50(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 71
LDI r2, 51
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 50
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
