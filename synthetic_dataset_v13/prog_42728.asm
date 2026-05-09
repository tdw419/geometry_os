; DESCRIPTION: Composite: Draws a orange rectangle at (413, 37) with width 97 and height 87 then Places a magenta dot at position (85, 119) then Renders a cyan line between points (72, 155) and (283, 62).
; PLAN: r0=413(x), r1=37(y), r2=97(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=119(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=72(x1), r11=155(y1), r12=283(x2), r13=62(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 37
LDI r2, 97
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 119
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 72
LDI r11, 155
LDI r12, 283
LDI r13, 62
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
