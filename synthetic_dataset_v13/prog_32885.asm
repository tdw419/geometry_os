; DESCRIPTION: Composite: Creates a purple circular shape at (288, 74) with radius 43 then Renders a black box of size 80x64 starting at (258, 75).
; PLAN: r0=288(x), r1=74(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=75(y), r7=80(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 74
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 75
LDI r7, 80
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
