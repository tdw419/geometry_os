; DESCRIPTION: Composite: Draws a purple rectangle at (204, 58) with width 66 and height 119 then Sets a single black pixel at (202, 94) then Renders a cyan line between points (70, 77) and (389, 227).
; PLAN: r0=204(x), r1=58(y), r2=66(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=94(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=70(x1), r11=77(y1), r12=389(x2), r13=227(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 58
LDI r2, 66
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 94
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 70
LDI r11, 77
LDI r12, 389
LDI r13, 227
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
