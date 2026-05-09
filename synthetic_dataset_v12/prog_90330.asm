; DESCRIPTION: Composite: Places a orange 87x100 rectangle at position (318, 140) then Places a yellow dot at position (152, 80) then Draws a white line from (230, 129) to (459, 135).
; PLAN: r0=318(x), r1=140(y), r2=87(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=80(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=230(x1), r11=129(y1), r12=459(x2), r13=135(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 140
LDI r2, 87
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 80
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 230
LDI r11, 129
LDI r12, 459
LDI r13, 135
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
