; DESCRIPTION: Composite: Creates a magenta rectangular region at (300, 124) spanning 77 by 37 pixels then Sets a single magenta pixel at (336, 34).
; PLAN: r0=300(x), r1=124(y), r2=77(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=34(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 300
LDI r1, 124
LDI r2, 77
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 34
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
