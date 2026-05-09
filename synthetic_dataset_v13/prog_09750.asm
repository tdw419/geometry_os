; DESCRIPTION: Composite: Draws a yellow line from (351, 100) to (131, 13) then Renders a magenta box of size 37x52 starting at (408, 56) then Creates a yellow circular shape at (354, 122) with radius 30.
; PLAN: r0=351(x1), r1=100(y1), r2=131(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=56(y), r7=37(width), r8=52(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=122(y), r12=30(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 100
LDI r2, 131
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 56
LDI r7, 37
LDI r8, 52
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 122
LDI r12, 30
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
