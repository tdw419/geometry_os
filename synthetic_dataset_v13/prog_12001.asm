; DESCRIPTION: Composite: Places a magenta 88x110 rectangle at position (391, 123) then Places a white circle of radius 25 at center (403, 181) then Draws a cyan line from (153, 193) to (36, 184).
; PLAN: r0=391(x), r1=123(y), r2=88(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=181(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x1), r11=193(y1), r12=36(x2), r13=184(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 123
LDI r2, 88
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 181
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 193
LDI r12, 36
LDI r13, 184
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
