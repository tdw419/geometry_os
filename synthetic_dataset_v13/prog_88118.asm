; DESCRIPTION: Composite: Renders a orange disk with center (138, 160) and radius 49 then Renders a magenta line between points (73, 210) and (329, 73) then Draws a purple rectangle at (421, 53) with width 73 and height 19.
; PLAN: r0=138(x), r1=160(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x1), r6=210(y1), r7=329(x2), r8=73(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=53(y), r12=73(width), r13=19(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 160
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 210
LDI r7, 329
LDI r8, 73
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 53
LDI r12, 73
LDI r13, 19
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
