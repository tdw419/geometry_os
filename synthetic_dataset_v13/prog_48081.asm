; DESCRIPTION: Composite: Places a yellow line segment connecting (132, 191) to (36, 223) then Places a yellow 58x40 rectangle at position (63, 45) then Creates a purple circular shape at (152, 50) with radius 18.
; PLAN: r0=132(x1), r1=191(y1), r2=36(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=45(y), r7=58(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=152(x), r11=50(y), r12=18(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 191
LDI r2, 36
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 45
LDI r7, 58
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 50
LDI r12, 18
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
