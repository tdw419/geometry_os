; DESCRIPTION: Composite: Creates a green circular shape at (161, 131) with radius 39 then Renders a blue box of size 100x106 starting at (115, 23).
; PLAN: r0=161(x), r1=131(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=23(y), r7=100(width), r8=106(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 131
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 23
LDI r7, 100
LDI r8, 106
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
