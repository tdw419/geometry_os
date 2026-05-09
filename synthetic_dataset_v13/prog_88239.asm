; DESCRIPTION: Composite: Renders a purple box of size 67x20 starting at (2, 11) then Renders a blue line between points (92, 131) and (465, 61) then Renders a blue disk with center (459, 175) and radius 33.
; PLAN: r0=2(x), r1=11(y), r2=67(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=131(y1), r7=465(x2), r8=61(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=459(x), r11=175(y), r12=33(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 11
LDI r2, 67
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 131
LDI r7, 465
LDI r8, 61
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 175
LDI r12, 33
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
