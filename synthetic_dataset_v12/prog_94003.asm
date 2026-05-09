; DESCRIPTION: Composite: Creates a black rectangular region at (120, 106) spanning 104 by 16 pixels then Places a magenta dot at position (511, 148).
; PLAN: r0=120(x), r1=106(y), r2=104(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x), r6=148(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 106
LDI r2, 104
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 148
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
