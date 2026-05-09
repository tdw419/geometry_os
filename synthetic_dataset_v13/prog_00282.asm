; DESCRIPTION: Composite: Places a orange dot at position (430, 88) then Renders a white line between points (14, 129) and (472, 136) then Renders a black box of size 36x42 starting at (350, 152).
; PLAN: r0=430(x), r1=88(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=129(y1), r7=472(x2), r8=136(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=152(y), r12=36(width), r13=42(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 88
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 14
LDI r6, 129
LDI r7, 472
LDI r8, 136
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 152
LDI r12, 36
LDI r13, 42
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
