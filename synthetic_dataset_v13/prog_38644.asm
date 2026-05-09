; DESCRIPTION: Composite: Renders a black disk with center (197, 147) and radius 61 then Draws a white line from (78, 143) to (128, 131) then Renders a purple box of size 104x41 starting at (129, 162).
; PLAN: r0=197(x), r1=147(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x1), r6=143(y1), r7=128(x2), r8=131(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=129(x), r11=162(y), r12=104(width), r13=41(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 147
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 143
LDI r7, 128
LDI r8, 131
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 162
LDI r12, 104
LDI r13, 41
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
