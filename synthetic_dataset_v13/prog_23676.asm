; DESCRIPTION: Composite: Renders a yellow box of size 32x37 starting at (425, 163) then Creates a green circular shape at (265, 31) with radius 29.
; PLAN: r0=425(x), r1=163(y), r2=32(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=31(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 163
LDI r2, 32
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 31
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
