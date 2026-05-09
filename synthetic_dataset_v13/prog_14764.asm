; DESCRIPTION: Composite: Sets a single white pixel at (416, 87) then Places a blue circle of radius 42 at center (260, 212) then Draws a purple line from (434, 31) to (359, 147).
; PLAN: r0=416(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=212(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=434(x1), r11=31(y1), r12=359(x2), r13=147(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 87
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 212
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 434
LDI r11, 31
LDI r12, 359
LDI r13, 147
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
