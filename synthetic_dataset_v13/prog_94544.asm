; DESCRIPTION: Composite: Draws a green line from (5, 116) to (404, 147) then Places a yellow circle of radius 63 at center (67, 85) then Draws a red rectangle at (230, 32) with width 119 and height 120.
; PLAN: r0=5(x1), r1=116(y1), r2=404(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=85(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=230(x), r11=32(y), r12=119(width), r13=120(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 116
LDI r2, 404
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 85
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 230
LDI r11, 32
LDI r12, 119
LDI r13, 120
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
