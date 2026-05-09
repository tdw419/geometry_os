; DESCRIPTION: Composite: Renders a purple box of size 100x23 starting at (395, 124) then Renders a black disk with center (118, 173) and radius 32.
; PLAN: r0=395(x), r1=124(y), r2=100(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=173(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 395
LDI r1, 124
LDI r2, 100
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 173
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
