; DESCRIPTION: Composite: Renders a cyan box of size 60x94 starting at (99, 76) then Renders a purple disk with center (280, 193) and radius 26.
; PLAN: r0=99(x), r1=76(y), r2=60(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=193(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 76
LDI r2, 60
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 193
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
