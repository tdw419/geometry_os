; DESCRIPTION: Composite: Renders a black box of size 72x104 starting at (274, 74) then Renders a white disk with center (166, 204) and radius 43.
; PLAN: r0=274(x), r1=74(y), r2=72(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=204(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 74
LDI r2, 72
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 204
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
