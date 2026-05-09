; DESCRIPTION: Composite: Renders a yellow box of size 92x105 starting at (80, 101) then Renders a black disk with center (131, 89) and radius 77.
; PLAN: r0=80(x), r1=101(y), r2=92(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=89(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 101
LDI r2, 92
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 89
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
