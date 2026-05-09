; DESCRIPTION: Composite: Draws a magenta rectangle at (110, 142) with width 40 and height 69 then Draws a yellow line from (232, 21) to (363, 59) then Places a green dot at position (329, 5).
; PLAN: r0=110(x), r1=142(y), r2=40(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x1), r6=21(y1), r7=363(x2), r8=59(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=5(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 142
LDI r2, 40
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 21
LDI r7, 363
LDI r8, 59
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 5
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
