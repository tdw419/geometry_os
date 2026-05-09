; DESCRIPTION: Composite: Places a green line segment connecting (174, 209) to (224, 149) then Renders a black disk with center (105, 51) and radius 40 then Creates a blue rectangular region at (371, 135) spanning 30 by 79 pixels.
; PLAN: r0=174(x1), r1=209(y1), r2=224(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=51(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x), r11=135(y), r12=30(width), r13=79(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 209
LDI r2, 224
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 51
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 135
LDI r12, 30
LDI r13, 79
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
