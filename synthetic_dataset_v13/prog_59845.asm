; DESCRIPTION: Composite: Draws a magenta line from (116, 247) to (219, 2) then Draws a green circle centered at (120, 215) with radius 17 then Draws a white rectangle at (330, 40) with width 20 and height 119.
; PLAN: r0=116(x1), r1=247(y1), r2=219(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=215(y), r7=17(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x), r11=40(y), r12=20(width), r13=119(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 247
LDI r2, 219
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 215
LDI r7, 17
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 40
LDI r12, 20
LDI r13, 119
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
