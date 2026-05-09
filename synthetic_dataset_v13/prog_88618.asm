; DESCRIPTION: Composite: Creates a cyan circular shape at (193, 86) with radius 69 then Draws a blue line from (409, 229) to (46, 176) then Renders a white box of size 86x63 starting at (347, 127).
; PLAN: r0=193(x), r1=86(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x1), r6=229(y1), r7=46(x2), r8=176(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=127(y), r12=86(width), r13=63(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 86
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 229
LDI r7, 46
LDI r8, 176
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 127
LDI r12, 86
LDI r13, 63
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
