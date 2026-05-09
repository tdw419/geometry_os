; DESCRIPTION: Composite: Renders a purple box of size 56x113 starting at (352, 99) then Creates a white circular shape at (77, 42) with radius 34 then Draws a purple line from (87, 218) to (428, 142).
; PLAN: r0=352(x), r1=99(y), r2=56(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=42(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=87(x1), r11=218(y1), r12=428(x2), r13=142(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 99
LDI r2, 56
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 42
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 87
LDI r11, 218
LDI r12, 428
LDI r13, 142
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
