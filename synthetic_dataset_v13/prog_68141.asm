; DESCRIPTION: Composite: Places a magenta circle of radius 50 at center (252, 145) then Renders a magenta box of size 64x17 starting at (26, 77) then Places a orange line segment connecting (387, 200) to (254, 41).
; PLAN: r0=252(x), r1=145(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=77(y), r7=64(width), r8=17(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=387(x1), r11=200(y1), r12=254(x2), r13=41(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 145
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 77
LDI r7, 64
LDI r8, 17
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 200
LDI r12, 254
LDI r13, 41
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
