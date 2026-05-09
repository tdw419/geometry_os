; DESCRIPTION: Composite: Draws a cyan rectangle at (46, 21) with width 20 and height 66 then Places a blue dot at position (223, 19) then Renders a orange line between points (320, 174) and (378, 155).
; PLAN: r0=46(x), r1=21(y), r2=20(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x), r6=19(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=320(x1), r11=174(y1), r12=378(x2), r13=155(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 21
LDI r2, 20
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 19
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 320
LDI r11, 174
LDI r12, 378
LDI r13, 155
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
