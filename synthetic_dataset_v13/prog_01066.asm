; DESCRIPTION: Composite: Creates a blue circular shape at (98, 97) with radius 63 then Renders a green box of size 116x91 starting at (322, 100).
; PLAN: r0=98(x), r1=97(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=100(y), r7=116(width), r8=91(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 97
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 100
LDI r7, 116
LDI r8, 91
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
