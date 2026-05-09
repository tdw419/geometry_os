; DESCRIPTION: Composite: Creates a purple rectangular region at (12, 109) spanning 39 by 30 pixels then Places a magenta dot at position (164, 148).
; PLAN: r0=12(x), r1=109(y), r2=39(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=148(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 109
LDI r2, 39
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 148
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
