; DESCRIPTION: Composite: Renders a yellow box of size 98x112 starting at (336, 130) then Places a black dot at position (506, 219) then Creates a purple circular shape at (182, 71) with radius 34.
; PLAN: r0=336(x), r1=130(y), r2=98(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x), r6=219(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=182(x), r11=71(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 336
LDI r1, 130
LDI r2, 98
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 219
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 182
LDI r11, 71
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
