; DESCRIPTION: Composite: Creates a purple rectangular region at (127, 131) spanning 109 by 107 pixels then Places a magenta dot at position (487, 239).
; PLAN: r0=127(x), r1=131(y), r2=109(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=487(x), r6=239(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 131
LDI r2, 109
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 239
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
