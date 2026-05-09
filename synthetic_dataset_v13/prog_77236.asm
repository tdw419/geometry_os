; DESCRIPTION: Composite: Renders a magenta box of size 47x99 starting at (353, 143) then Places a cyan dot at position (34, 150) then Places a blue line segment connecting (457, 137) to (148, 155).
; PLAN: r0=353(x), r1=143(y), r2=47(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x), r6=150(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=457(x1), r11=137(y1), r12=148(x2), r13=155(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 143
LDI r2, 47
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 150
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 457
LDI r11, 137
LDI r12, 148
LDI r13, 155
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
