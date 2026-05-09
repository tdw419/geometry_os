; DESCRIPTION: Composite: Places a red line segment connecting (368, 24) to (237, 59) then Sets a single purple pixel at (168, 55) then Renders a purple box of size 97x66 starting at (212, 62).
; PLAN: r0=368(x1), r1=24(y1), r2=237(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=55(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=62(y), r12=97(width), r13=66(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 24
LDI r2, 237
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 55
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 212
LDI r11, 62
LDI r12, 97
LDI r13, 66
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
