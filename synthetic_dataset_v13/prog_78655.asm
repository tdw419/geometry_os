; DESCRIPTION: Composite: Sets a single blue pixel at (491, 62) then Renders a white line between points (437, 180) and (240, 241) then Draws a white rectangle at (74, 46) with width 89 and height 83.
; PLAN: r0=491(x), r1=62(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=437(x1), r6=180(y1), r7=240(x2), r8=241(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=46(y), r12=89(width), r13=83(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 62
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 180
LDI r7, 240
LDI r8, 241
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 46
LDI r12, 89
LDI r13, 83
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
