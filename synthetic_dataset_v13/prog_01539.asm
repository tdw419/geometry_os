; DESCRIPTION: Composite: Places a white circle of radius 25 at center (397, 214) then Draws a white line from (12, 204) to (245, 44) then Renders a blue box of size 115x50 starting at (132, 99).
; PLAN: r0=397(x), r1=214(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x1), r6=204(y1), r7=245(x2), r8=44(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=99(y), r12=115(width), r13=50(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 214
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 204
LDI r7, 245
LDI r8, 44
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 99
LDI r12, 115
LDI r13, 50
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
