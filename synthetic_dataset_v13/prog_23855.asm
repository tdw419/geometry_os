; DESCRIPTION: Composite: Creates a green rectangular region at (141, 124) spanning 60 by 99 pixels then Sets a single yellow pixel at (141, 164).
; PLAN: r0=141(x), r1=124(y), r2=60(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=164(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 124
LDI r2, 60
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 164
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
