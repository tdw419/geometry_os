; DESCRIPTION: Composite: Draws a green line from (404, 175) to (262, 140) then Sets a single blue pixel at (296, 211) then Renders a orange box of size 24x60 starting at (200, 196).
; PLAN: r0=404(x1), r1=175(y1), r2=262(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=211(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=200(x), r11=196(y), r12=24(width), r13=60(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 175
LDI r2, 262
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 211
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 200
LDI r11, 196
LDI r12, 24
LDI r13, 60
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
