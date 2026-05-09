; DESCRIPTION: Composite: Renders a green line between points (278, 97) and (371, 36) then Renders a yellow disk with center (44, 85) and radius 18 then Draws a cyan rectangle at (256, 86) with width 84 and height 98.
; PLAN: r0=278(x1), r1=97(y1), r2=371(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=85(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=86(y), r12=84(width), r13=98(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 97
LDI r2, 371
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 85
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 86
LDI r12, 84
LDI r13, 98
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
