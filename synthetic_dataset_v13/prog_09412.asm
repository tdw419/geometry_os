; DESCRIPTION: Composite: Draws a yellow circle centered at (410, 163) with radius 72 then Renders a purple box of size 37x99 starting at (195, 133) then Draws a red line from (282, 43) to (316, 57).
; PLAN: r0=410(x), r1=163(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=133(y), r7=37(width), r8=99(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x1), r11=43(y1), r12=316(x2), r13=57(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 163
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 133
LDI r7, 37
LDI r8, 99
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 43
LDI r12, 316
LDI r13, 57
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
