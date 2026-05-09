; DESCRIPTION: Composite: Places a orange 119x110 rectangle at position (217, 72) then Places a white dot at position (56, 28) then Draws a orange line from (144, 152) to (175, 201).
; PLAN: r0=217(x), r1=72(y), r2=119(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=28(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=144(x1), r11=152(y1), r12=175(x2), r13=201(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 72
LDI r2, 119
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 28
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 144
LDI r11, 152
LDI r12, 175
LDI r13, 201
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
