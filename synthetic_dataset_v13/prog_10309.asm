; DESCRIPTION: Composite: Renders a orange box of size 38x40 starting at (352, 155) then Sets a single magenta pixel at (156, 211) then Renders a purple line between points (406, 14) and (174, 173).
; PLAN: r0=352(x), r1=155(y), r2=38(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=211(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=406(x1), r11=14(y1), r12=174(x2), r13=173(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 155
LDI r2, 38
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 211
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 406
LDI r11, 14
LDI r12, 174
LDI r13, 173
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
