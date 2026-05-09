; DESCRIPTION: Composite: Places a white dot at position (350, 241) then Draws a cyan rectangle at (226, 156) with width 59 and height 20 then Renders a black line between points (46, 227) and (464, 219).
; PLAN: r0=350(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=156(y), r7=59(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x1), r11=227(y1), r12=464(x2), r13=219(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 241
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 226
LDI r6, 156
LDI r7, 59
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 227
LDI r12, 464
LDI r13, 219
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
