; DESCRIPTION: Composite: Draws a green rectangle at (370, 190) with width 108 and height 16 then Creates a blue circular shape at (82, 192) with radius 56 then Renders a green line between points (394, 104) and (204, 37).
; PLAN: r0=370(x), r1=190(y), r2=108(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=192(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x1), r11=104(y1), r12=204(x2), r13=37(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 190
LDI r2, 108
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 192
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 104
LDI r12, 204
LDI r13, 37
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
