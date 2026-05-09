; DESCRIPTION: Composite: Creates a orange rectangular region at (2, 71) spanning 85 by 14 pixels then Places a green dot at position (255, 222) then Draws a blue line from (283, 145) to (403, 125).
; PLAN: r0=2(x), r1=71(y), r2=85(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=222(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=283(x1), r11=145(y1), r12=403(x2), r13=125(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 71
LDI r2, 85
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 222
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 283
LDI r11, 145
LDI r12, 403
LDI r13, 125
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
