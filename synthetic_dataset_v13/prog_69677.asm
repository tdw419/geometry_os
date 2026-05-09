; DESCRIPTION: Composite: Places a black 114x43 rectangle at position (164, 3) then Draws a green circle centered at (303, 163) with radius 63 then Places a magenta line segment connecting (125, 91) to (264, 215).
; PLAN: r0=164(x), r1=3(y), r2=114(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=163(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x1), r11=91(y1), r12=264(x2), r13=215(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 3
LDI r2, 114
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 163
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 91
LDI r12, 264
LDI r13, 215
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
