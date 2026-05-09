; DESCRIPTION: Composite: Creates a blue rectangular region at (187, 8) spanning 73 by 63 pixels then Places a magenta circle of radius 60 at center (192, 131).
; PLAN: r0=187(x), r1=8(y), r2=73(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=131(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 8
LDI r2, 73
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 131
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
