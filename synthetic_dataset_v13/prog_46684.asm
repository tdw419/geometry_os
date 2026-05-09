; DESCRIPTION: Composite: Sets a single blue pixel at (460, 164) then Draws a green rectangle at (195, 127) with width 54 and height 40 then Creates a magenta circular shape at (200, 122) with radius 70.
; PLAN: r0=460(x), r1=164(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=127(y), r7=54(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x), r11=122(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 164
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 195
LDI r6, 127
LDI r7, 54
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 122
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
