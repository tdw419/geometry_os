; DESCRIPTION: Composite: Places a blue dot at position (410, 2) then Draws a yellow line from (466, 197) to (35, 17) then Renders a white box of size 118x66 starting at (155, 43).
; PLAN: r0=410(x), r1=2(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=466(x1), r6=197(y1), r7=35(x2), r8=17(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=43(y), r12=118(width), r13=66(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 2
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 466
LDI r6, 197
LDI r7, 35
LDI r8, 17
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 43
LDI r12, 118
LDI r13, 66
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
