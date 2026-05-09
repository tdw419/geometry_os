; DESCRIPTION: Composite: Creates a purple rectangular region at (283, 80) spanning 21 by 66 pixels then Renders a yellow disk with center (428, 174) and radius 61 then Draws a yellow line from (227, 194) to (401, 172).
; PLAN: r0=283(x), r1=80(y), r2=21(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x), r6=174(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=227(x1), r11=194(y1), r12=401(x2), r13=172(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 80
LDI r2, 21
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 174
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 227
LDI r11, 194
LDI r12, 401
LDI r13, 172
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
