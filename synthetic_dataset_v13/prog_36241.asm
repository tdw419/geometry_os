; DESCRIPTION: Composite: Renders a orange disk with center (234, 117) and radius 24 then Renders a red box of size 104x108 starting at (188, 103) then Renders a black line between points (27, 113) and (469, 229).
; PLAN: r0=234(x), r1=117(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=103(y), r7=104(width), r8=108(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=27(x1), r11=113(y1), r12=469(x2), r13=229(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 117
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 103
LDI r7, 104
LDI r8, 108
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 113
LDI r12, 469
LDI r13, 229
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
