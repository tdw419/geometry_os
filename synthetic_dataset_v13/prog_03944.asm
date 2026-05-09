; DESCRIPTION: Composite: Places a blue 82x96 rectangle at position (149, 111) then Renders a blue disk with center (329, 162) and radius 77 then Places a orange line segment connecting (261, 184) to (198, 24).
; PLAN: r0=149(x), r1=111(y), r2=82(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=162(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=261(x1), r11=184(y1), r12=198(x2), r13=24(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 111
LDI r2, 82
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 162
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 261
LDI r11, 184
LDI r12, 198
LDI r13, 24
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
