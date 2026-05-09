; DESCRIPTION: Composite: Creates a orange rectangular region at (293, 98) spanning 55 by 10 pixels then Places a orange dot at position (88, 140).
; PLAN: r0=293(x), r1=98(y), r2=55(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=140(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 98
LDI r2, 55
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 140
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
