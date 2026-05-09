; DESCRIPTION: Composite: Sets a single green pixel at (40, 34) then Creates a blue circular shape at (393, 123) with radius 30 then Places a cyan 65x97 rectangle at position (396, 75).
; PLAN: r0=40(x), r1=34(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=123(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=75(y), r12=65(width), r13=97(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 34
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 393
LDI r6, 123
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 75
LDI r12, 65
LDI r13, 97
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
