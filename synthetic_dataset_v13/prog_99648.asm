; DESCRIPTION: Composite: Places a red dot at position (223, 189) then Draws a black line from (343, 209) to (500, 247) then Draws a green rectangle at (232, 138) with width 26 and height 113.
; PLAN: r0=223(x), r1=189(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=343(x1), r6=209(y1), r7=500(x2), r8=247(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=138(y), r12=26(width), r13=113(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 189
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 343
LDI r6, 209
LDI r7, 500
LDI r8, 247
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 138
LDI r12, 26
LDI r13, 113
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
