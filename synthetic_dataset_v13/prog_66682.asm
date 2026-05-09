; DESCRIPTION: Composite: Places a green 37x108 rectangle at position (459, 28) then Renders a white disk with center (180, 184) and radius 56 then Places a purple line segment connecting (442, 68) to (459, 54).
; PLAN: r0=459(x), r1=28(y), r2=37(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=184(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=442(x1), r11=68(y1), r12=459(x2), r13=54(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 28
LDI r2, 37
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 184
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 442
LDI r11, 68
LDI r12, 459
LDI r13, 54
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
