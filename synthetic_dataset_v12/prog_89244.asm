; DESCRIPTION: Composite: Creates a blue rectangular region at (72, 161) spanning 36 by 56 pixels then Sets a single magenta pixel at (195, 243).
; PLAN: r0=72(x), r1=161(y), r2=36(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=243(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 161
LDI r2, 36
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 243
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
