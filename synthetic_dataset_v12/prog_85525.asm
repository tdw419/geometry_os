; DESCRIPTION: Composite: Creates a magenta rectangular region at (233, 153) spanning 50 by 100 pixels then Places a black dot at position (3, 240).
; PLAN: r0=233(x), r1=153(y), r2=50(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=240(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 233
LDI r1, 153
LDI r2, 50
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 240
LDI r7, 0x000000
PSET r5, r6, r7
HALT
