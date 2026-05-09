; DESCRIPTION: Composite: Creates a blue rectangular region at (336, 64) spanning 93 by 98 pixels then Places a red dot at position (335, 88).
; PLAN: r0=336(x), r1=64(y), r2=93(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=88(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 64
LDI r2, 93
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 88
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
