; DESCRIPTION: Composite: Renders a cyan box of size 111x111 starting at (270, 53) then Creates a purple circular shape at (74, 36) with radius 26.
; PLAN: r0=270(x), r1=53(y), r2=111(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=36(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 53
LDI r2, 111
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 36
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
