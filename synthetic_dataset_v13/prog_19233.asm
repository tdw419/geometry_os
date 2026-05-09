; DESCRIPTION: Composite: Draws a green line from (60, 248) to (25, 55) then Sets a single white pixel at (163, 10) then Renders a green box of size 97x32 starting at (222, 199).
; PLAN: r0=60(x1), r1=248(y1), r2=25(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=10(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=222(x), r11=199(y), r12=97(width), r13=32(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 248
LDI r2, 25
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 10
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 222
LDI r11, 199
LDI r12, 97
LDI r13, 32
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
