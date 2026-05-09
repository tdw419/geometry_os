; DESCRIPTION: Composite: Renders a green line between points (136, 255) and (165, 107) then Places a blue circle of radius 25 at center (26, 210) then Places a white 21x109 rectangle at position (405, 0).
; PLAN: r0=136(x1), r1=255(y1), r2=165(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=210(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=0(y), r12=21(width), r13=109(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 255
LDI r2, 165
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 210
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 0
LDI r12, 21
LDI r13, 109
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
