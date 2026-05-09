; DESCRIPTION: Composite: Creates a red rectangular region at (114, 50) spanning 114 by 120 pixels then Places a red dot at position (508, 148).
; PLAN: r0=114(x), r1=50(y), r2=114(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x), r6=148(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 114
LDI r1, 50
LDI r2, 114
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 148
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
