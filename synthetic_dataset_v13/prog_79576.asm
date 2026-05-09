; DESCRIPTION: Composite: Draws a orange circle centered at (196, 144) with radius 52 then Renders a red box of size 95x79 starting at (193, 147) then Draws a cyan line from (117, 232) to (453, 227).
; PLAN: r0=196(x), r1=144(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=147(y), r7=95(width), r8=79(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x1), r11=232(y1), r12=453(x2), r13=227(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 144
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 147
LDI r7, 95
LDI r8, 79
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 232
LDI r12, 453
LDI r13, 227
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
