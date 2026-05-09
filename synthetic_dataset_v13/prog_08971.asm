; DESCRIPTION: Composite: Places a purple line segment connecting (268, 45) to (44, 224) then Sets a single white pixel at (324, 166) then Places a purple 97x60 rectangle at position (137, 55).
; PLAN: r0=268(x1), r1=45(y1), r2=44(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=166(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=137(x), r11=55(y), r12=97(width), r13=60(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 45
LDI r2, 44
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 166
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 137
LDI r11, 55
LDI r12, 97
LDI r13, 60
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
