; DESCRIPTION: Composite: Renders a purple box of size 23x70 starting at (32, 98) then Creates a cyan circular shape at (191, 94) with radius 12.
; PLAN: r0=32(x), r1=98(y), r2=23(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=94(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 32
LDI r1, 98
LDI r2, 23
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 94
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
