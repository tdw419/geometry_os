; DESCRIPTION: Composite: Draws a cyan line from (272, 189) to (328, 128) then Places a purple circle of radius 16 at center (185, 78) then Places a white dot at position (338, 224).
; PLAN: r0=272(x1), r1=189(y1), r2=328(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=78(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=224(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 189
LDI r2, 328
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 78
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 224
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
