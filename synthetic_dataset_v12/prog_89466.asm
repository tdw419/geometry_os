; DESCRIPTION: Composite: Places a magenta line segment connecting (38, 152) to (402, 236) then Draws a orange circle centered at (259, 187) with radius 29.
; PLAN: r0=38(x1), r1=152(y1), r2=402(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=187(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 152
LDI r2, 402
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 187
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
