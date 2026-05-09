; DESCRIPTION: Composite: Creates a yellow circular shape at (65, 178) with radius 36 then Places a cyan line segment connecting (1, 66) to (155, 249) then Places a purple 85x92 rectangle at position (140, 17).
; PLAN: r0=65(x), r1=178(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x1), r6=66(y1), r7=155(x2), r8=249(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=17(y), r12=85(width), r13=92(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 178
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 66
LDI r7, 155
LDI r8, 249
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 17
LDI r12, 85
LDI r13, 92
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
