; DESCRIPTION: Composite: Places a green 112x46 rectangle at position (113, 10) then Creates a purple circular shape at (139, 85) with radius 55.
; PLAN: r0=113(x), r1=10(y), r2=112(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=85(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 10
LDI r2, 112
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 85
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
