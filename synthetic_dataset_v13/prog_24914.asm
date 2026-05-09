; DESCRIPTION: Composite: Sets a single blue pixel at (492, 21) then Renders a red box of size 91x20 starting at (296, 93) then Places a orange line segment connecting (444, 142) to (107, 19).
; PLAN: r0=492(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=93(y), r7=91(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=444(x1), r11=142(y1), r12=107(x2), r13=19(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 492
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 93
LDI r7, 91
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 142
LDI r12, 107
LDI r13, 19
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
