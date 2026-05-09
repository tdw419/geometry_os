; DESCRIPTION: Composite: Places a black 112x67 rectangle at position (227, 117) then Renders a white disk with center (370, 174) and radius 57 then Draws a blue line from (196, 46) to (189, 113).
; PLAN: r0=227(x), r1=117(y), r2=112(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=174(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=196(x1), r11=46(y1), r12=189(x2), r13=113(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 117
LDI r2, 112
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 174
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 196
LDI r11, 46
LDI r12, 189
LDI r13, 113
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
