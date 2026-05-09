; DESCRIPTION: Composite: Renders a green box of size 24x85 starting at (459, 15) then Creates a red circular shape at (241, 74) with radius 61.
; PLAN: r0=459(x), r1=15(y), r2=24(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=74(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 459
LDI r1, 15
LDI r2, 24
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 74
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
