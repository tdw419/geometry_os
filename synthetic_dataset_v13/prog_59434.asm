; DESCRIPTION: Composite: Renders a cyan box of size 117x84 starting at (281, 170) then Creates a white circular shape at (150, 137) with radius 75 then Draws a black line from (203, 191) to (493, 99).
; PLAN: r0=281(x), r1=170(y), r2=117(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=137(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x1), r11=191(y1), r12=493(x2), r13=99(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 170
LDI r2, 117
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 137
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 191
LDI r12, 493
LDI r13, 99
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
