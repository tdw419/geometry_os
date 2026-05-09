; DESCRIPTION: Composite: Places a black 97x67 rectangle at position (99, 12) then Places a blue dot at position (211, 60) then Places a purple line segment connecting (329, 39) to (369, 30).
; PLAN: r0=99(x), r1=12(y), r2=97(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=60(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=329(x1), r11=39(y1), r12=369(x2), r13=30(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 12
LDI r2, 97
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 60
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 329
LDI r11, 39
LDI r12, 369
LDI r13, 30
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
