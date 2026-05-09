; DESCRIPTION: Composite: Places a yellow line segment connecting (337, 152) to (73, 140) then Draws a orange circle centered at (334, 129) with radius 26 then Creates a orange rectangular region at (7, 120) spanning 54 by 54 pixels.
; PLAN: r0=337(x1), r1=152(y1), r2=73(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=129(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=7(x), r11=120(y), r12=54(width), r13=54(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 152
LDI r2, 73
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 129
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 7
LDI r11, 120
LDI r12, 54
LDI r13, 54
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
