; DESCRIPTION: Composite: Draws a white circle centered at (326, 199) with radius 34 then Renders a yellow line between points (5, 233) and (191, 171) then Draws a red rectangle at (279, 49) with width 86 and height 39.
; PLAN: r0=326(x), r1=199(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x1), r6=233(y1), r7=191(x2), r8=171(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=49(y), r12=86(width), r13=39(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 199
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 233
LDI r7, 191
LDI r8, 171
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 49
LDI r12, 86
LDI r13, 39
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
