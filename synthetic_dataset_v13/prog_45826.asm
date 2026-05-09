; DESCRIPTION: Composite: Places a black 68x20 rectangle at position (79, 234) then Renders a orange disk with center (213, 48) and radius 11 then Draws a blue line from (185, 2) to (338, 100).
; PLAN: r0=79(x), r1=234(y), r2=68(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=48(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x1), r11=2(y1), r12=338(x2), r13=100(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 234
LDI r2, 68
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 48
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 2
LDI r12, 338
LDI r13, 100
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
