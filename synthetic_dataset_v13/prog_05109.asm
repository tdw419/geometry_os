; DESCRIPTION: Composite: Places a red line segment connecting (467, 12) to (98, 174) then Creates a red circular shape at (270, 192) with radius 63 then Renders a green box of size 117x36 starting at (353, 191).
; PLAN: r0=467(x1), r1=12(y1), r2=98(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=192(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=353(x), r11=191(y), r12=117(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 12
LDI r2, 98
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 192
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 353
LDI r11, 191
LDI r12, 117
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
