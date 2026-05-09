; DESCRIPTION: Composite: Places a purple line segment connecting (511, 33) to (82, 11) then Creates a magenta circular shape at (388, 47) with radius 44 then Renders a orange box of size 13x94 starting at (18, 126).
; PLAN: r0=511(x1), r1=33(y1), r2=82(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=47(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x), r11=126(y), r12=13(width), r13=94(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 511
LDI r1, 33
LDI r2, 82
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 47
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 126
LDI r12, 13
LDI r13, 94
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
