; DESCRIPTION: Composite: Places a orange 92x80 rectangle at position (150, 172) then Renders a cyan disk with center (402, 61) and radius 57 then Draws a purple line from (122, 201) to (290, 95).
; PLAN: r0=150(x), r1=172(y), r2=92(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=61(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x1), r11=201(y1), r12=290(x2), r13=95(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 172
LDI r2, 92
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 61
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 201
LDI r12, 290
LDI r13, 95
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
