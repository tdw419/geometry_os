; DESCRIPTION: Composite: Draws a purple circle centered at (252, 55) with radius 18 then Draws a magenta line from (219, 224) to (80, 252).
; PLAN: r0=252(x), r1=55(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x1), r6=224(y1), r7=80(x2), r8=252(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 55
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 224
LDI r7, 80
LDI r8, 252
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
