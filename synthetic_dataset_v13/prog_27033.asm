; DESCRIPTION: Composite: Creates a blue rectangular region at (333, 143) spanning 35 by 35 pixels then Places a black circle of radius 42 at center (52, 204) then Draws a purple line from (120, 182) to (204, 219).
; PLAN: r0=333(x), r1=143(y), r2=35(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=204(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x1), r11=182(y1), r12=204(x2), r13=219(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 143
LDI r2, 35
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 204
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 182
LDI r12, 204
LDI r13, 219
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
