; DESCRIPTION: Composite: Renders a red box of size 112x29 starting at (13, 116) then Renders a red disk with center (237, 182) and radius 67.
; PLAN: r0=13(x), r1=116(y), r2=112(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=182(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 13
LDI r1, 116
LDI r2, 112
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 182
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
