; DESCRIPTION: Composite: Places a purple line segment connecting (249, 146) to (477, 239) then Creates a magenta circular shape at (337, 187) with radius 43 then Places a yellow 24x80 rectangle at position (403, 91).
; PLAN: r0=249(x1), r1=146(y1), r2=477(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=187(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=403(x), r11=91(y), r12=24(width), r13=80(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 146
LDI r2, 477
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 187
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 403
LDI r11, 91
LDI r12, 24
LDI r13, 80
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
