; DESCRIPTION: Composite: Renders a blue disk with center (198, 128) and radius 11 then Draws a orange rectangle at (180, 137) with width 19 and height 97 then Places a green dot at position (312, 13).
; PLAN: r0=198(x), r1=128(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x), r6=137(y), r7=19(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x), r11=13(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 128
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 137
LDI r7, 19
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 13
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
