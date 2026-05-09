; DESCRIPTION: Composite: Draws a cyan rectangle at (392, 4) with width 110 and height 53 then Sets a single green pixel at (463, 10) then Places a black circle of radius 32 at center (119, 164).
; PLAN: r0=392(x), r1=4(y), r2=110(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=10(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=119(x), r11=164(y), r12=32(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 4
LDI r2, 110
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 10
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 119
LDI r11, 164
LDI r12, 32
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
