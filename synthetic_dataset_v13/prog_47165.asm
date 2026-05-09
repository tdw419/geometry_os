; DESCRIPTION: Composite: Draws a black circle centered at (259, 115) with radius 76 then Draws a yellow line from (401, 220) to (165, 246) then Draws a white rectangle at (357, 73) with width 94 and height 48.
; PLAN: r0=259(x), r1=115(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x1), r6=220(y1), r7=165(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=73(y), r12=94(width), r13=48(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 115
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 220
LDI r7, 165
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 73
LDI r12, 94
LDI r13, 48
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
