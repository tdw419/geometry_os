; DESCRIPTION: Composite: Creates a purple rectangular region at (341, 19) spanning 74 by 27 pixels then Renders a yellow disk with center (214, 192) and radius 16.
; PLAN: r0=341(x), r1=19(y), r2=74(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=192(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 19
LDI r2, 74
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 192
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
