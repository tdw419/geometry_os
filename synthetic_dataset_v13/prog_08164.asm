; DESCRIPTION: Composite: Renders a blue box of size 50x119 starting at (307, 133) then Creates a red circular shape at (276, 54) with radius 30.
; PLAN: r0=307(x), r1=133(y), r2=50(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=54(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 133
LDI r2, 50
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 54
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
