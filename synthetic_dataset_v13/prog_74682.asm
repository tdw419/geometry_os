; DESCRIPTION: Composite: Places a blue circle of radius 72 at center (173, 102) then Renders a purple box of size 27x13 starting at (325, 124) then Draws a black line from (337, 30) to (151, 152).
; PLAN: r0=173(x), r1=102(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=124(y), r7=27(width), r8=13(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x1), r11=30(y1), r12=151(x2), r13=152(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 102
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 124
LDI r7, 27
LDI r8, 13
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 30
LDI r12, 151
LDI r13, 152
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
