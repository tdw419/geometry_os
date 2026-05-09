; DESCRIPTION: Composite: Renders a yellow line between points (301, 191) and (487, 19) then Renders a magenta box of size 77x116 starting at (122, 11) then Creates a green circular shape at (315, 242) with radius 12.
; PLAN: r0=301(x1), r1=191(y1), r2=487(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=11(y), r7=77(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=242(y), r12=12(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 191
LDI r2, 487
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 11
LDI r7, 77
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 242
LDI r12, 12
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
