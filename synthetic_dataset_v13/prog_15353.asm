; DESCRIPTION: Composite: Creates a blue rectangular region at (402, 120) spanning 24 by 67 pixels then Places a white dot at position (106, 194) then Places a purple line segment connecting (499, 42) to (54, 143).
; PLAN: r0=402(x), r1=120(y), r2=24(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=194(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=499(x1), r11=42(y1), r12=54(x2), r13=143(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 120
LDI r2, 24
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 194
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 499
LDI r11, 42
LDI r12, 54
LDI r13, 143
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
