; DESCRIPTION: Composite: Renders a blue box of size 86x64 starting at (131, 60) then Places a green circle of radius 69 at center (172, 168).
; PLAN: r0=131(x), r1=60(y), r2=86(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=168(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 60
LDI r2, 86
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 168
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
