; DESCRIPTION: Composite: Creates a orange rectangular region at (238, 50) spanning 101 by 82 pixels then Places a red circle of radius 33 at center (451, 177).
; PLAN: r0=238(x), r1=50(y), r2=101(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x), r6=177(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 238
LDI r1, 50
LDI r2, 101
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 177
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
