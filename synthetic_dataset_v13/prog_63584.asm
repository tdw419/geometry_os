; DESCRIPTION: Composite: Creates a yellow circular shape at (146, 183) with radius 60 then Creates a black rectangular region at (101, 20) spanning 78 by 85 pixels then Draws a green line from (509, 204) to (36, 197).
; PLAN: r0=146(x), r1=183(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=20(y), r7=78(width), r8=85(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=509(x1), r11=204(y1), r12=36(x2), r13=197(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 183
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 20
LDI r7, 78
LDI r8, 85
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 509
LDI r11, 204
LDI r12, 36
LDI r13, 197
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
