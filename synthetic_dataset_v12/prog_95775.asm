; DESCRIPTION: Composite: Draws a blue line from (234, 223) to (55, 132) then Places a cyan circle of radius 24 at center (259, 152) then Renders a blue box of size 99x80 starting at (261, 156).
; PLAN: r0=234(x1), r1=223(y1), r2=55(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=152(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=261(x), r11=156(y), r12=99(width), r13=80(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 223
LDI r2, 55
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 152
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 261
LDI r11, 156
LDI r12, 99
LDI r13, 80
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
