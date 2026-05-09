; DESCRIPTION: Composite: Places a blue 80x60 rectangle at position (28, 74) then Renders a black disk with center (103, 118) and radius 16 then Renders a purple line between points (400, 149) and (120, 201).
; PLAN: r0=28(x), r1=74(y), r2=80(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=118(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x1), r11=149(y1), r12=120(x2), r13=201(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 74
LDI r2, 80
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 118
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 149
LDI r12, 120
LDI r13, 201
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
