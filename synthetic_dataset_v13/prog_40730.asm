; DESCRIPTION: Composite: Creates a white circular shape at (399, 98) with radius 30 then Creates a purple rectangular region at (409, 87) spanning 73 by 12 pixels then Draws a white line from (132, 221) to (189, 18).
; PLAN: r0=399(x), r1=98(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=87(y), r7=73(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x1), r11=221(y1), r12=189(x2), r13=18(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 98
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 87
LDI r7, 73
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 221
LDI r12, 189
LDI r13, 18
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
