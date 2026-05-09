; DESCRIPTION: Composite: Places a orange 55x17 rectangle at position (417, 84) then Places a purple circle of radius 22 at center (120, 27).
; PLAN: r0=417(x), r1=84(y), r2=55(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=27(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 84
LDI r2, 55
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 27
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
