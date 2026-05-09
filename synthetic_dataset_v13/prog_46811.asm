; DESCRIPTION: Composite: Places a purple 20x99 rectangle at position (270, 60) then Renders a white disk with center (398, 178) and radius 72 then Draws a purple line from (330, 144) to (320, 144).
; PLAN: r0=270(x), r1=60(y), r2=20(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x), r6=178(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x1), r11=144(y1), r12=320(x2), r13=144(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 60
LDI r2, 20
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 178
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 144
LDI r12, 320
LDI r13, 144
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
