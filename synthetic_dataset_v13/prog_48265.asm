; DESCRIPTION: Composite: Renders a black box of size 93x56 starting at (215, 143) then Draws a blue circle centered at (323, 154) with radius 70.
; PLAN: r0=215(x), r1=143(y), r2=93(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=154(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 143
LDI r2, 93
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 154
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
