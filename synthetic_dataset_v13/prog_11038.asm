; DESCRIPTION: Composite: Renders a green disk with center (103, 99) and radius 70 then Creates a yellow rectangular region at (181, 184) spanning 43 by 50 pixels.
; PLAN: r0=103(x), r1=99(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=184(y), r7=43(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 99
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 184
LDI r7, 43
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
