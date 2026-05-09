; DESCRIPTION: Composite: Places a red dot at position (287, 215) then Draws a purple circle centered at (90, 117) with radius 44 then Renders a yellow line between points (154, 122) and (356, 1).
; PLAN: r0=287(x), r1=215(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=117(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x1), r11=122(y1), r12=356(x2), r13=1(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 215
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 90
LDI r6, 117
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 122
LDI r12, 356
LDI r13, 1
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
