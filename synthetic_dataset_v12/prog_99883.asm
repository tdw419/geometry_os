; DESCRIPTION: Composite: Draws a orange rectangle at (11, 65) with width 113 and height 82 then Places a green dot at position (71, 63) then Places a magenta line segment connecting (489, 192) to (505, 86).
; PLAN: r0=11(x), r1=65(y), r2=113(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=63(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=489(x1), r11=192(y1), r12=505(x2), r13=86(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 65
LDI r2, 113
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 63
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 489
LDI r11, 192
LDI r12, 505
LDI r13, 86
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
