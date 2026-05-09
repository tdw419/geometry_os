; DESCRIPTION: Composite: Creates a orange rectangular region at (234, 48) spanning 100 by 114 pixels then Places a blue dot at position (10, 93).
; PLAN: r0=234(x), r1=48(y), r2=100(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=93(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 48
LDI r2, 100
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 93
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
