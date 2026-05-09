; DESCRIPTION: Composite: Creates a blue circular shape at (110, 142) with radius 12 then Renders a magenta box of size 115x97 starting at (137, 26).
; PLAN: r0=110(x), r1=142(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x), r6=26(y), r7=115(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 142
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 26
LDI r7, 115
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
