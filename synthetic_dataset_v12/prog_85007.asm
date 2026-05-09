; DESCRIPTION: Composite: Places a yellow line segment connecting (410, 66) to (113, 136) then Places a magenta dot at position (449, 102) then Draws a orange rectangle at (337, 189) with width 76 and height 26.
; PLAN: r0=410(x1), r1=66(y1), r2=113(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=102(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=189(y), r12=76(width), r13=26(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 66
LDI r2, 113
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 102
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 189
LDI r12, 76
LDI r13, 26
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
