; DESCRIPTION: Composite: Renders a white box of size 81x33 starting at (42, 145) then Renders a magenta disk with center (231, 157) and radius 51.
; PLAN: r0=42(x), r1=145(y), r2=81(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=157(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 145
LDI r2, 81
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 157
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
