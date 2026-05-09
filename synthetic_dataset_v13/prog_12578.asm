; DESCRIPTION: Composite: Creates a blue rectangular region at (457, 192) spanning 55 by 29 pixels then Sets a single yellow pixel at (70, 228).
; PLAN: r0=457(x), r1=192(y), r2=55(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=228(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 192
LDI r2, 55
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 228
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
