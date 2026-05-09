; DESCRIPTION: Composite: Creates a yellow circular shape at (195, 120) with radius 12 then Places a yellow 71x34 rectangle at position (105, 60) then Places a green line segment connecting (201, 227) to (323, 243).
; PLAN: r0=195(x), r1=120(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=60(y), r7=71(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x1), r11=227(y1), r12=323(x2), r13=243(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 120
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 60
LDI r7, 71
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 227
LDI r12, 323
LDI r13, 243
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
