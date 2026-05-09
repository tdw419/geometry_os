; DESCRIPTION: Composite: Places a black 83x54 rectangle at position (414, 64) then Renders a black disk with center (60, 140) and radius 44.
; PLAN: r0=414(x), r1=64(y), r2=83(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=140(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 414
LDI r1, 64
LDI r2, 83
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 140
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
