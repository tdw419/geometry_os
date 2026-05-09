; DESCRIPTION: Composite: Draws a cyan rectangle at (260, 24) with width 88 and height 85 then Places a black circle of radius 70 at center (123, 87) then Places a white dot at position (191, 33).
; PLAN: r0=260(x), r1=24(y), r2=88(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=87(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x), r11=33(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 260
LDI r1, 24
LDI r2, 88
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 87
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 33
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
