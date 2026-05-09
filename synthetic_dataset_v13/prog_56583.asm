; DESCRIPTION: Composite: Renders a black box of size 103x72 starting at (109, 121) then Draws a yellow line from (335, 251) to (502, 109) then Draws a blue circle centered at (281, 50) with radius 25.
; PLAN: r0=109(x), r1=121(y), r2=103(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x1), r6=251(y1), r7=502(x2), r8=109(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=50(y), r12=25(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 121
LDI r2, 103
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 251
LDI r7, 502
LDI r8, 109
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 50
LDI r12, 25
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
