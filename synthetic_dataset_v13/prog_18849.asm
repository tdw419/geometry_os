; DESCRIPTION: Composite: Renders a green box of size 15x36 starting at (415, 0) then Places a red dot at position (26, 140) then Draws a purple line from (350, 62) to (356, 102).
; PLAN: r0=415(x), r1=0(y), r2=15(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=140(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=350(x1), r11=62(y1), r12=356(x2), r13=102(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 0
LDI r2, 15
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 140
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 350
LDI r11, 62
LDI r12, 356
LDI r13, 102
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
