; DESCRIPTION: Composite: Draws a black line from (201, 127) to (263, 68) then Draws a magenta rectangle at (435, 140) with width 76 and height 27 then Draws a magenta circle centered at (132, 164) with radius 48.
; PLAN: r0=201(x1), r1=127(y1), r2=263(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=140(y), r7=76(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=132(x), r11=164(y), r12=48(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 127
LDI r2, 263
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 140
LDI r7, 76
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 164
LDI r12, 48
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
