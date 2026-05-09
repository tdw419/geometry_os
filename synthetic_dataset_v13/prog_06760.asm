; DESCRIPTION: Composite: Renders a black box of size 15x107 starting at (453, 37) then Creates a black circular shape at (198, 118) with radius 45 then Places a green line segment connecting (151, 135) to (90, 208).
; PLAN: r0=453(x), r1=37(y), r2=15(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=118(y), r7=45(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=151(x1), r11=135(y1), r12=90(x2), r13=208(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 37
LDI r2, 15
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 118
LDI r7, 45
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 151
LDI r11, 135
LDI r12, 90
LDI r13, 208
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
