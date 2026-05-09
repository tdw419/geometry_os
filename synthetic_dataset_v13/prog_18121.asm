; DESCRIPTION: Composite: Places a white line segment connecting (180, 225) to (85, 213) then Draws a yellow rectangle at (107, 122) with width 111 and height 91 then Sets a single magenta pixel at (367, 147).
; PLAN: r0=180(x1), r1=225(y1), r2=85(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=122(y), r7=111(width), r8=91(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x), r11=147(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 180
LDI r1, 225
LDI r2, 85
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 122
LDI r7, 111
LDI r8, 91
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 147
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
