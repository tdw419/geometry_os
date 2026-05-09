; DESCRIPTION: Composite: Places a yellow line segment connecting (435, 41) to (135, 172) then Places a red dot at position (485, 100) then Creates a green rectangular region at (195, 20) spanning 48 by 39 pixels.
; PLAN: r0=435(x1), r1=41(y1), r2=135(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=485(x), r6=100(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=20(y), r12=48(width), r13=39(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 435
LDI r1, 41
LDI r2, 135
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 100
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 195
LDI r11, 20
LDI r12, 48
LDI r13, 39
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
