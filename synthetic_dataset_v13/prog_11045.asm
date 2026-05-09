; DESCRIPTION: Composite: Creates a yellow rectangular region at (281, 6) spanning 92 by 79 pixels then Sets a single purple pixel at (453, 146).
; PLAN: r0=281(x), r1=6(y), r2=92(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=146(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 6
LDI r2, 92
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 146
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
