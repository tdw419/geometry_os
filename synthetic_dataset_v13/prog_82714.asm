; DESCRIPTION: Composite: Renders a cyan box of size 66x15 starting at (396, 210) then Places a red circle of radius 37 at center (78, 189) then Draws a purple line from (191, 249) to (402, 214).
; PLAN: r0=396(x), r1=210(y), r2=66(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=189(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x1), r11=249(y1), r12=402(x2), r13=214(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 210
LDI r2, 66
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 189
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 249
LDI r12, 402
LDI r13, 214
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
