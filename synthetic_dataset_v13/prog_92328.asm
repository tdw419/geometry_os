; DESCRIPTION: Composite: Places a black 83x119 rectangle at position (298, 30) then Renders a magenta disk with center (47, 224) and radius 30.
; PLAN: r0=298(x), r1=30(y), r2=83(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=224(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 30
LDI r2, 83
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 224
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
