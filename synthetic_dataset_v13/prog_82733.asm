; DESCRIPTION: Composite: Renders a yellow box of size 77x37 starting at (434, 145) then Creates a purple circular shape at (131, 82) with radius 14.
; PLAN: r0=434(x), r1=145(y), r2=77(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=82(y), r7=14(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 434
LDI r1, 145
LDI r2, 77
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 82
LDI r7, 14
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
