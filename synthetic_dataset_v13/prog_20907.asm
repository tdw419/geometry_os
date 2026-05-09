; DESCRIPTION: Composite: Places a magenta circle of radius 72 at center (358, 100) then Creates a orange rectangular region at (427, 81) spanning 11 by 98 pixels.
; PLAN: r0=358(x), r1=100(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=81(y), r7=11(width), r8=98(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 100
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 81
LDI r7, 11
LDI r8, 98
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
