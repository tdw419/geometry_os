; DESCRIPTION: Composite: Draws a yellow line from (13, 206) to (508, 129) then Creates a red circular shape at (322, 174) with radius 65 then Draws a purple rectangle at (354, 51) with width 108 and height 36.
; PLAN: r0=13(x1), r1=206(y1), r2=508(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=174(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x), r11=51(y), r12=108(width), r13=36(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 206
LDI r2, 508
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 174
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 51
LDI r12, 108
LDI r13, 36
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
