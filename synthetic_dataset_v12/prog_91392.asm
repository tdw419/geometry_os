; DESCRIPTION: Composite: Creates a cyan circular shape at (93, 106) with radius 70 then Renders a orange box of size 11x110 starting at (267, 137).
; PLAN: r0=93(x), r1=106(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=137(y), r7=11(width), r8=110(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 106
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 137
LDI r7, 11
LDI r8, 110
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
