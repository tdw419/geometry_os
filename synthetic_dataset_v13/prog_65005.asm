; DESCRIPTION: Composite: Creates a green rectangular region at (191, 12) spanning 117 by 92 pixels then Places a purple dot at position (157, 186).
; PLAN: r0=191(x), r1=12(y), r2=117(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=186(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 12
LDI r2, 117
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 186
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
