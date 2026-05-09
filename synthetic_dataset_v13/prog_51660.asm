; DESCRIPTION: Composite: Creates a black circular shape at (335, 99) with radius 43 then Creates a orange rectangular region at (152, 150) spanning 41 by 47 pixels then Renders a white line between points (328, 194) and (345, 61).
; PLAN: r0=335(x), r1=99(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=150(y), r7=41(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=328(x1), r11=194(y1), r12=345(x2), r13=61(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 99
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 150
LDI r7, 41
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 194
LDI r12, 345
LDI r13, 61
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
