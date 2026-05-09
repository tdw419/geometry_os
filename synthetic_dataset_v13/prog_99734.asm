; DESCRIPTION: Composite: Places a green line segment connecting (288, 248) to (87, 109) then Places a green dot at position (372, 90) then Places a blue 84x44 rectangle at position (425, 10).
; PLAN: r0=288(x1), r1=248(y1), r2=87(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=90(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=10(y), r12=84(width), r13=44(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 248
LDI r2, 87
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 90
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 425
LDI r11, 10
LDI r12, 84
LDI r13, 44
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
