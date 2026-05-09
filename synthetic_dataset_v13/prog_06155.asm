; DESCRIPTION: Composite: Draws a yellow line from (396, 223) to (263, 32) then Draws a green rectangle at (65, 202) with width 73 and height 32 then Draws a purple circle centered at (81, 124) with radius 44.
; PLAN: r0=396(x1), r1=223(y1), r2=263(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=202(y), r7=73(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x), r11=124(y), r12=44(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 223
LDI r2, 263
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 202
LDI r7, 73
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 124
LDI r12, 44
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
