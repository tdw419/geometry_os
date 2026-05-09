; DESCRIPTION: Composite: Renders a magenta box of size 68x112 starting at (203, 26) then Renders a purple disk with center (119, 225) and radius 25 then Sets a single magenta pixel at (352, 20).
; PLAN: r0=203(x), r1=26(y), r2=68(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=225(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x), r11=20(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 26
LDI r2, 68
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 225
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 20
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
