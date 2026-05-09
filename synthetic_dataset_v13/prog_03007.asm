; DESCRIPTION: Composite: Renders a magenta box of size 31x32 starting at (52, 206) then Places a yellow dot at position (484, 40) then Draws a orange line from (436, 7) to (236, 220).
; PLAN: r0=52(x), r1=206(y), r2=31(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=40(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=436(x1), r11=7(y1), r12=236(x2), r13=220(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 206
LDI r2, 31
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 40
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 436
LDI r11, 7
LDI r12, 236
LDI r13, 220
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
