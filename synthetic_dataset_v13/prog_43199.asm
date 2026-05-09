; DESCRIPTION: Composite: Places a blue 65x59 rectangle at position (92, 110) then Draws a blue line from (402, 77) to (280, 244) then Renders a red disk with center (209, 144) and radius 39.
; PLAN: r0=92(x), r1=110(y), r2=65(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=77(y1), r7=280(x2), r8=244(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=144(y), r12=39(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 110
LDI r2, 65
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 77
LDI r7, 280
LDI r8, 244
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 144
LDI r12, 39
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
