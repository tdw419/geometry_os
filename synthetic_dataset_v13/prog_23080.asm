; DESCRIPTION: Composite: Draws a purple circle centered at (376, 209) with radius 35 then Draws a yellow line from (481, 65) to (402, 233) then Draws a cyan rectangle at (488, 171) with width 10 and height 69.
; PLAN: r0=376(x), r1=209(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x1), r6=65(y1), r7=402(x2), r8=233(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=488(x), r11=171(y), r12=10(width), r13=69(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 209
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 65
LDI r7, 402
LDI r8, 233
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 171
LDI r12, 10
LDI r13, 69
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
