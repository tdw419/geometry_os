; DESCRIPTION: Composite: Creates a magenta circular shape at (313, 94) with radius 15 then Renders a purple line between points (433, 196) and (245, 144) then Renders a green box of size 103x22 starting at (43, 3).
; PLAN: r0=313(x), r1=94(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=196(y1), r7=245(x2), r8=144(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=43(x), r11=3(y), r12=103(width), r13=22(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 94
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 196
LDI r7, 245
LDI r8, 144
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 3
LDI r12, 103
LDI r13, 22
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
