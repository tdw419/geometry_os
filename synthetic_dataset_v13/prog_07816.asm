; DESCRIPTION: Composite: Sets a single orange pixel at (223, 81) then Draws a white line from (504, 170) to (183, 38) then Renders a yellow box of size 80x21 starting at (350, 110).
; PLAN: r0=223(x), r1=81(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=170(y1), r7=183(x2), r8=38(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=110(y), r12=80(width), r13=21(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 81
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 504
LDI r6, 170
LDI r7, 183
LDI r8, 38
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 110
LDI r12, 80
LDI r13, 21
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
