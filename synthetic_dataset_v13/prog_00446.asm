; DESCRIPTION: Composite: Sets a single magenta pixel at (176, 200) then Renders a white line between points (43, 206) and (102, 253) then Draws a yellow rectangle at (264, 25) with width 64 and height 62.
; PLAN: r0=176(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=43(x1), r6=206(y1), r7=102(x2), r8=253(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=25(y), r12=64(width), r13=62(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 200
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 43
LDI r6, 206
LDI r7, 102
LDI r8, 253
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 25
LDI r12, 64
LDI r13, 62
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
