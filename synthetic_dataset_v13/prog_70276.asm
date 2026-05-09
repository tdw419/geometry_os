; DESCRIPTION: Composite: Creates a orange rectangular region at (19, 21) spanning 81 by 80 pixels then Sets a single blue pixel at (460, 107).
; PLAN: r0=19(x), r1=21(y), r2=81(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=107(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 21
LDI r2, 81
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 107
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
