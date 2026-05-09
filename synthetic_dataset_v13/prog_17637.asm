; DESCRIPTION: Composite: Creates a black rectangular region at (274, 2) spanning 111 by 106 pixels then Places a magenta dot at position (487, 178).
; PLAN: r0=274(x), r1=2(y), r2=111(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=178(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 2
LDI r2, 111
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 178
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
