; DESCRIPTION: Composite: Places a orange circle of radius 39 at center (93, 151) then Renders a magenta box of size 115x99 starting at (183, 136).
; PLAN: r0=93(x), r1=151(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=136(y), r7=115(width), r8=99(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 151
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 136
LDI r7, 115
LDI r8, 99
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
