; DESCRIPTION: Composite: Renders a magenta line between points (37, 242) and (163, 129) then Creates a magenta circular shape at (314, 200) with radius 18 then Renders a magenta box of size 91x11 starting at (229, 149).
; PLAN: r0=37(x1), r1=242(y1), r2=163(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=200(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=229(x), r11=149(y), r12=91(width), r13=11(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 37
LDI r1, 242
LDI r2, 163
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 200
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 229
LDI r11, 149
LDI r12, 91
LDI r13, 11
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
