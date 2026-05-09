; DESCRIPTION: Composite: Creates a blue rectangular region at (316, 141) spanning 48 by 112 pixels then Places a orange dot at position (176, 119).
; PLAN: r0=316(x), r1=141(y), r2=48(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=119(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 141
LDI r2, 48
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 119
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
