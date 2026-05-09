; DESCRIPTION: Composite: Renders a white box of size 80x50 starting at (30, 86) then Creates a cyan circular shape at (40, 174) with radius 37 then Draws a purple line from (58, 77) to (69, 233).
; PLAN: r0=30(x), r1=86(y), r2=80(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=174(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x1), r11=77(y1), r12=69(x2), r13=233(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 86
LDI r2, 80
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 174
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 77
LDI r12, 69
LDI r13, 233
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
