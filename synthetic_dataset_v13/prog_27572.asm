; DESCRIPTION: Composite: Draws a yellow rectangle at (215, 63) with width 70 and height 52 then Creates a cyan circular shape at (263, 90) with radius 58 then Places a purple line segment connecting (76, 180) to (71, 239).
; PLAN: r0=215(x), r1=63(y), r2=70(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=90(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x1), r11=180(y1), r12=71(x2), r13=239(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 63
LDI r2, 70
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 90
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 180
LDI r12, 71
LDI r13, 239
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
