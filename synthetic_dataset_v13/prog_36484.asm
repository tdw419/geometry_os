; DESCRIPTION: Composite: Renders a red disk with center (254, 73) and radius 54 then Renders a magenta box of size 90x93 starting at (29, 56).
; PLAN: r0=254(x), r1=73(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=56(y), r7=90(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 73
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 56
LDI r7, 90
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
