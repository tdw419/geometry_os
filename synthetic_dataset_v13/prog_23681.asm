; DESCRIPTION: Composite: Renders a orange line between points (405, 173) and (145, 169) then Draws a magenta rectangle at (366, 133) with width 116 and height 110 then Places a red dot at position (330, 146).
; PLAN: r0=405(x1), r1=173(y1), r2=145(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=133(y), r7=116(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x), r11=146(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 173
LDI r2, 145
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 133
LDI r7, 116
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 146
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
