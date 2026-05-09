; DESCRIPTION: Composite: Places a orange 75x34 rectangle at position (285, 13) then Draws a orange circle centered at (237, 191) with radius 61 then Draws a white line from (206, 222) to (331, 91).
; PLAN: r0=285(x), r1=13(y), r2=75(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=191(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=206(x1), r11=222(y1), r12=331(x2), r13=91(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 13
LDI r2, 75
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 191
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 206
LDI r11, 222
LDI r12, 331
LDI r13, 91
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
