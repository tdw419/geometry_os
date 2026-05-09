; DESCRIPTION: Composite: Renders a magenta box of size 61x50 starting at (358, 115) then Creates a purple circular shape at (153, 171) with radius 44.
; PLAN: r0=358(x), r1=115(y), r2=61(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=171(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 358
LDI r1, 115
LDI r2, 61
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 171
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
