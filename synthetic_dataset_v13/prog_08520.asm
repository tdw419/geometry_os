; DESCRIPTION: Composite: Renders a yellow box of size 116x55 starting at (103, 51) then Creates a purple circular shape at (144, 161) with radius 71.
; PLAN: r0=103(x), r1=51(y), r2=116(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=161(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 51
LDI r2, 116
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 161
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
