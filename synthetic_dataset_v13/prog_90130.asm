; DESCRIPTION: Composite: Places a purple line segment connecting (373, 50) to (459, 34) then Sets a single red pixel at (280, 232) then Places a orange 21x49 rectangle at position (228, 194).
; PLAN: r0=373(x1), r1=50(y1), r2=459(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=232(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=228(x), r11=194(y), r12=21(width), r13=49(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 50
LDI r2, 459
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 232
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 228
LDI r11, 194
LDI r12, 21
LDI r13, 49
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
