; DESCRIPTION: Composite: Renders a magenta box of size 18x50 starting at (385, 192) then Creates a blue circular shape at (310, 133) with radius 42.
; PLAN: r0=385(x), r1=192(y), r2=18(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=133(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 385
LDI r1, 192
LDI r2, 18
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 133
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
