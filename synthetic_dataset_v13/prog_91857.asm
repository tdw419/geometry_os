; DESCRIPTION: Composite: Places a green dot at position (336, 142) then Draws a green rectangle at (5, 47) with width 21 and height 100 then Renders a white line between points (312, 147) and (492, 25).
; PLAN: r0=336(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=5(x), r6=47(y), r7=21(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x1), r11=147(y1), r12=492(x2), r13=25(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 142
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 5
LDI r6, 47
LDI r7, 21
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 147
LDI r12, 492
LDI r13, 25
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
