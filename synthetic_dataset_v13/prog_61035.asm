; DESCRIPTION: Composite: Places a white 116x78 rectangle at position (108, 3) then Places a yellow circle of radius 56 at center (349, 176) then Places a blue dot at position (397, 250).
; PLAN: r0=108(x), r1=3(y), r2=116(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=176(y), r7=56(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=397(x), r11=250(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 3
LDI r2, 116
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 176
LDI r7, 56
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 397
LDI r11, 250
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
