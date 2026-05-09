; DESCRIPTION: Composite: Places a blue line segment connecting (275, 140) to (56, 65) then Renders a green disk with center (373, 72) and radius 56 then Renders a magenta box of size 76x47 starting at (148, 62).
; PLAN: r0=275(x1), r1=140(y1), r2=56(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=72(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=62(y), r12=76(width), r13=47(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 140
LDI r2, 56
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 72
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 62
LDI r12, 76
LDI r13, 47
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
