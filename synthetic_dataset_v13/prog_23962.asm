; DESCRIPTION: Composite: Creates a cyan rectangular region at (221, 168) spanning 103 by 51 pixels then Sets a single blue pixel at (489, 154).
; PLAN: r0=221(x), r1=168(y), r2=103(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x), r6=154(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 168
LDI r2, 103
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 154
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
