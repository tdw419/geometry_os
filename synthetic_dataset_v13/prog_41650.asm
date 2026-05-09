; DESCRIPTION: Composite: Renders a red disk with center (75, 156) and radius 65 then Renders a purple box of size 49x22 starting at (25, 194).
; PLAN: r0=75(x), r1=156(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=194(y), r7=49(width), r8=22(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 156
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 194
LDI r7, 49
LDI r8, 22
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
