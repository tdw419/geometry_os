; DESCRIPTION: Composite: Places a purple 19x52 rectangle at position (345, 183) then Creates a green circular shape at (106, 91) with radius 55.
; PLAN: r0=345(x), r1=183(y), r2=19(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=91(y), r7=55(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 183
LDI r2, 19
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 91
LDI r7, 55
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
