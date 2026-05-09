; DESCRIPTION: Composite: Renders a yellow disk with center (365, 130) and radius 28 then Renders a purple line between points (181, 18) and (336, 116) then Renders a blue box of size 24x71 starting at (338, 81).
; PLAN: r0=365(x), r1=130(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=18(y1), r7=336(x2), r8=116(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=81(y), r12=24(width), r13=71(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 130
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 18
LDI r7, 336
LDI r8, 116
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 81
LDI r12, 24
LDI r13, 71
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
