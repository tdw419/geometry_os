; DESCRIPTION: Composite: Creates a blue circular shape at (365, 60) with radius 20 then Renders a black box of size 16x19 starting at (260, 135).
; PLAN: r0=365(x), r1=60(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=135(y), r7=16(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 60
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 135
LDI r7, 16
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
