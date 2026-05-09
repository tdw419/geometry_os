; DESCRIPTION: Composite: Places a black dot at position (400, 113) then Draws a blue line from (392, 225) to (2, 147) then Draws a black rectangle at (242, 167) with width 61 and height 83.
; PLAN: r0=400(x), r1=113(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=392(x1), r6=225(y1), r7=2(x2), r8=147(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=167(y), r12=61(width), r13=83(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 113
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 392
LDI r6, 225
LDI r7, 2
LDI r8, 147
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 167
LDI r12, 61
LDI r13, 83
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
