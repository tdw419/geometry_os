; DESCRIPTION: Composite: Draws a blue rectangle at (76, 135) with width 117 and height 11 then Sets a single red pixel at (278, 130) then Draws a cyan line from (491, 10) to (18, 140).
; PLAN: r0=76(x), r1=135(y), r2=117(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=130(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=491(x1), r11=10(y1), r12=18(x2), r13=140(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 135
LDI r2, 117
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 130
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 491
LDI r11, 10
LDI r12, 18
LDI r13, 140
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
