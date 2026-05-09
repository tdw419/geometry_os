; DESCRIPTION: Composite: Creates a magenta rectangular region at (367, 153) spanning 68 by 20 pixels then Sets a single blue pixel at (30, 213).
; PLAN: r0=367(x), r1=153(y), r2=68(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x), r6=213(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 153
LDI r2, 68
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 213
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
