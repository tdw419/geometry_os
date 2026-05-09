; DESCRIPTION: Composite: Places a black dot at position (432, 17) then Draws a black line from (58, 34) to (275, 149) then Places a blue 64x104 rectangle at position (104, 152).
; PLAN: r0=432(x), r1=17(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=58(x1), r6=34(y1), r7=275(x2), r8=149(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=152(y), r12=64(width), r13=104(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 17
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 58
LDI r6, 34
LDI r7, 275
LDI r8, 149
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 152
LDI r12, 64
LDI r13, 104
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
