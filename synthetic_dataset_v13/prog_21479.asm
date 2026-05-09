; DESCRIPTION: Composite: Creates a black rectangular region at (209, 67) spanning 62 by 120 pixels then Places a white dot at position (251, 26) then Places a white line segment connecting (412, 124) to (363, 78).
; PLAN: r0=209(x), r1=67(y), r2=62(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x), r6=26(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=412(x1), r11=124(y1), r12=363(x2), r13=78(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 67
LDI r2, 62
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 26
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 412
LDI r11, 124
LDI r12, 363
LDI r13, 78
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
