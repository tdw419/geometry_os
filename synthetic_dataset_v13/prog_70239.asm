; DESCRIPTION: Composite: Renders a white box of size 48x32 starting at (393, 81) then Renders a purple disk with center (158, 101) and radius 22.
; PLAN: r0=393(x), r1=81(y), r2=48(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=101(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 81
LDI r2, 48
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 101
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
