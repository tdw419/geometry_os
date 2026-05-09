; DESCRIPTION: Composite: Renders a magenta disk with center (312, 76) and radius 55 then Creates a orange rectangular region at (432, 131) spanning 56 by 92 pixels.
; PLAN: r0=312(x), r1=76(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=131(y), r7=56(width), r8=92(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 76
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 131
LDI r7, 56
LDI r8, 92
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
