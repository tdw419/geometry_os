; DESCRIPTION: Composite: Places a magenta line segment connecting (444, 110) to (280, 28) then Draws a orange rectangle at (124, 101) with width 45 and height 57 then Draws a magenta circle centered at (458, 196) with radius 30.
; PLAN: r0=444(x1), r1=110(y1), r2=280(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=101(y), r7=45(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=458(x), r11=196(y), r12=30(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 110
LDI r2, 280
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 101
LDI r7, 45
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 196
LDI r12, 30
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
