; DESCRIPTION: Composite: Places a orange 118x88 rectangle at position (101, 8) then Places a white circle of radius 28 at center (373, 129) then Renders a magenta line between points (250, 60) and (89, 143).
; PLAN: r0=101(x), r1=8(y), r2=118(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=129(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x1), r11=60(y1), r12=89(x2), r13=143(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 8
LDI r2, 118
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 129
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 60
LDI r12, 89
LDI r13, 143
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
