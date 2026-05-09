; DESCRIPTION: Composite: Draws a orange line from (493, 144) to (224, 25) then Draws a blue rectangle at (230, 51) with width 33 and height 89 then Draws a magenta circle centered at (144, 156) with radius 37.
; PLAN: r0=493(x1), r1=144(y1), r2=224(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=51(y), r7=33(width), r8=89(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=144(x), r11=156(y), r12=37(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 493
LDI r1, 144
LDI r2, 224
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 51
LDI r7, 33
LDI r8, 89
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 144
LDI r11, 156
LDI r12, 37
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
