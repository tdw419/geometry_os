; DESCRIPTION: Composite: Renders a yellow line between points (273, 1) and (315, 249) then Places a blue circle of radius 53 at center (297, 114) then Places a white 54x33 rectangle at position (32, 87).
; PLAN: r0=273(x1), r1=1(y1), r2=315(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=114(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=32(x), r11=87(y), r12=54(width), r13=33(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 1
LDI r2, 315
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 114
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 32
LDI r11, 87
LDI r12, 54
LDI r13, 33
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
