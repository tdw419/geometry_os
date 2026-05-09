; DESCRIPTION: Composite: Places a blue dot at position (97, 123) then Draws a yellow line from (70, 75) to (191, 73) then Draws a red rectangle at (206, 68) with width 102 and height 12.
; PLAN: r0=97(x), r1=123(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=70(x1), r6=75(y1), r7=191(x2), r8=73(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=68(y), r12=102(width), r13=12(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 123
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 70
LDI r6, 75
LDI r7, 191
LDI r8, 73
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 68
LDI r12, 102
LDI r13, 12
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
