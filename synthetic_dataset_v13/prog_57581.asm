; DESCRIPTION: Composite: Renders a purple box of size 30x62 starting at (449, 58) then Creates a cyan circular shape at (216, 121) with radius 26.
; PLAN: r0=449(x), r1=58(y), r2=30(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=121(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 58
LDI r2, 30
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 121
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
