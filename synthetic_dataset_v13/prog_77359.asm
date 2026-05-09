; DESCRIPTION: Composite: Creates a orange rectangular region at (193, 31) spanning 76 by 112 pixels then Places a blue dot at position (407, 28).
; PLAN: r0=193(x), r1=31(y), r2=76(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=28(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 193
LDI r1, 31
LDI r2, 76
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 28
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
