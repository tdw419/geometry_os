; DESCRIPTION: Composite: Places a black 56x38 rectangle at position (73, 32) then Renders a orange disk with center (93, 212) and radius 12 then Sets a single green pixel at (505, 196).
; PLAN: r0=73(x), r1=32(y), r2=56(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=212(y), r7=12(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x), r11=196(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 32
LDI r2, 56
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 212
LDI r7, 12
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 196
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
