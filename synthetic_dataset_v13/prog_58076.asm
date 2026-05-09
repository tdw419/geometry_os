; DESCRIPTION: Composite: Places a white line segment connecting (284, 107) to (485, 164) then Creates a purple circular shape at (240, 123) with radius 63 then Creates a red rectangular region at (158, 51) spanning 79 by 42 pixels.
; PLAN: r0=284(x1), r1=107(y1), r2=485(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=123(y), r7=63(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x), r11=51(y), r12=79(width), r13=42(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 107
LDI r2, 485
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 123
LDI r7, 63
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 51
LDI r12, 79
LDI r13, 42
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
