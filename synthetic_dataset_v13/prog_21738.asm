; DESCRIPTION: Composite: Draws a red line from (446, 10) to (105, 204) then Places a magenta dot at position (172, 156) then Draws a yellow rectangle at (76, 144) with width 108 and height 102.
; PLAN: r0=446(x1), r1=10(y1), r2=105(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=156(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=144(y), r12=108(width), r13=102(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 10
LDI r2, 105
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 156
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 76
LDI r11, 144
LDI r12, 108
LDI r13, 102
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
