; DESCRIPTION: Composite: Renders a white line between points (94, 134) and (2, 53) then Renders a orange disk with center (395, 85) and radius 23 then Creates a orange rectangular region at (28, 121) spanning 20 by 47 pixels.
; PLAN: r0=94(x1), r1=134(y1), r2=2(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=85(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=121(y), r12=20(width), r13=47(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 134
LDI r2, 2
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 85
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 121
LDI r12, 20
LDI r13, 47
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
