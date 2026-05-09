; DESCRIPTION: Composite: Places a blue dot at position (29, 142) then Draws a black rectangle at (266, 115) with width 75 and height 92 then Draws a black line from (398, 201) to (128, 211).
; PLAN: r0=29(x), r1=142(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=115(y), r7=75(width), r8=92(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x1), r11=201(y1), r12=128(x2), r13=211(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 142
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 115
LDI r7, 75
LDI r8, 92
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 201
LDI r12, 128
LDI r13, 211
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
