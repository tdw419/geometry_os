; DESCRIPTION: Composite: Draws a purple circle centered at (358, 181) with radius 22 then Places a cyan 56x54 rectangle at position (348, 197) then Places a white dot at position (331, 121).
; PLAN: r0=358(x), r1=181(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=197(y), r7=56(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x), r11=121(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 181
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 197
LDI r7, 56
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 121
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
