; DESCRIPTION: Composite: Places a blue dot at position (231, 110) then Draws a blue line from (245, 30) to (393, 159) then Draws a green rectangle at (98, 54) with width 109 and height 42.
; PLAN: r0=231(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=245(x1), r6=30(y1), r7=393(x2), r8=159(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=54(y), r12=109(width), r13=42(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 245
LDI r6, 30
LDI r7, 393
LDI r8, 159
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 54
LDI r12, 109
LDI r13, 42
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
