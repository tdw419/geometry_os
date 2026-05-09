; DESCRIPTION: Composite: Creates a magenta rectangular region at (287, 90) spanning 50 by 12 pixels then Places a yellow dot at position (229, 251).
; PLAN: r0=287(x), r1=90(y), r2=50(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=251(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 90
LDI r2, 50
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 251
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
