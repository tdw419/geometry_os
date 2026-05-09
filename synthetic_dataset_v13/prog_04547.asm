; DESCRIPTION: Composite: Renders a orange line between points (179, 241) and (389, 192) then Places a blue dot at position (108, 127) then Draws a yellow rectangle at (224, 33) with width 60 and height 111.
; PLAN: r0=179(x1), r1=241(y1), r2=389(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=127(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=224(x), r11=33(y), r12=60(width), r13=111(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 241
LDI r2, 389
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 127
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 224
LDI r11, 33
LDI r12, 60
LDI r13, 111
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
