; DESCRIPTION: Composite: Draws a yellow rectangle at (185, 105) with width 21 and height 84 then Renders a orange line between points (191, 61) and (28, 156) then Places a magenta dot at position (387, 120).
; PLAN: r0=185(x), r1=105(y), r2=21(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x1), r6=61(y1), r7=28(x2), r8=156(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=387(x), r11=120(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 105
LDI r2, 21
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 61
LDI r7, 28
LDI r8, 156
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 120
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
