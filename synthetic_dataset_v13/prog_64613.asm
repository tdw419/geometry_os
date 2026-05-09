; DESCRIPTION: Composite: Renders a white disk with center (434, 106) and radius 60 then Places a green line segment connecting (201, 109) to (376, 16) then Renders a magenta box of size 70x61 starting at (430, 135).
; PLAN: r0=434(x), r1=106(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x1), r6=109(y1), r7=376(x2), r8=16(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=430(x), r11=135(y), r12=70(width), r13=61(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 106
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 109
LDI r7, 376
LDI r8, 16
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 135
LDI r12, 70
LDI r13, 61
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
