; DESCRIPTION: Composite: Places a magenta 116x32 rectangle at position (384, 168) then Renders a white disk with center (282, 188) and radius 45.
; PLAN: r0=384(x), r1=168(y), r2=116(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=188(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 168
LDI r2, 116
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 188
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
