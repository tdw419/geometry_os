; DESCRIPTION: Composite: Draws a magenta line from (469, 178) to (367, 117) then Creates a green circular shape at (404, 134) with radius 63 then Renders a blue box of size 22x53 starting at (428, 189).
; PLAN: r0=469(x1), r1=178(y1), r2=367(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=134(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=428(x), r11=189(y), r12=22(width), r13=53(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 178
LDI r2, 367
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 134
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 428
LDI r11, 189
LDI r12, 22
LDI r13, 53
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
