; DESCRIPTION: Composite: Draws a orange rectangle at (143, 227) with width 48 and height 20 then Sets a single purple pixel at (367, 210) then Places a green circle of radius 78 at center (176, 133).
; PLAN: r0=143(x), r1=227(y), r2=48(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=210(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=133(y), r12=78(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 227
LDI r2, 48
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 210
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 133
LDI r12, 78
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
