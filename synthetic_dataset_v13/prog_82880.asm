; DESCRIPTION: Composite: Places a cyan line segment connecting (254, 72) to (262, 50) then Sets a single purple pixel at (421, 151) then Draws a purple rectangle at (188, 160) with width 28 and height 14.
; PLAN: r0=254(x1), r1=72(y1), r2=262(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=151(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=188(x), r11=160(y), r12=28(width), r13=14(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 72
LDI r2, 262
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 151
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 188
LDI r11, 160
LDI r12, 28
LDI r13, 14
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
