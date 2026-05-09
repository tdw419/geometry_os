; DESCRIPTION: Composite: Draws a blue circle centered at (428, 192) with radius 47 then Draws a blue rectangle at (24, 99) with width 16 and height 25 then Places a white dot at position (176, 180).
; PLAN: r0=428(x), r1=192(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=99(y), r7=16(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x), r11=180(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 428
LDI r1, 192
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 99
LDI r7, 16
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 180
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
