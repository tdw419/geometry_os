; DESCRIPTION: Composite: Places a blue 14x99 rectangle at position (312, 135) then Draws a orange line from (245, 237) to (148, 232) then Sets a single white pixel at (32, 137).
; PLAN: r0=312(x), r1=135(y), r2=14(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x1), r6=237(y1), r7=148(x2), r8=232(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=32(x), r11=137(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 135
LDI r2, 14
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 237
LDI r7, 148
LDI r8, 232
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 137
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
