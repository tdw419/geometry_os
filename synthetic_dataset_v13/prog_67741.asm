; DESCRIPTION: Composite: Creates a purple rectangular region at (391, 10) spanning 102 by 48 pixels then Renders a blue disk with center (69, 212) and radius 21 then Renders a magenta line between points (394, 87) and (44, 217).
; PLAN: r0=391(x), r1=10(y), r2=102(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=212(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x1), r11=87(y1), r12=44(x2), r13=217(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 10
LDI r2, 102
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 212
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 87
LDI r12, 44
LDI r13, 217
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
