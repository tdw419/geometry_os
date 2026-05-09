; DESCRIPTION: Composite: Places a green dot at position (424, 98) then Draws a green rectangle at (180, 52) with width 30 and height 87 then Renders a yellow line between points (222, 91) and (16, 146).
; PLAN: r0=424(x), r1=98(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=52(y), r7=30(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x1), r11=91(y1), r12=16(x2), r13=146(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 98
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 180
LDI r6, 52
LDI r7, 30
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 91
LDI r12, 16
LDI r13, 146
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
