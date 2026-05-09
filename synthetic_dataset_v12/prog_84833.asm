; DESCRIPTION: Composite: Draws a cyan circle centered at (179, 59) with radius 25 then Renders a black line between points (142, 147) and (251, 17) then Renders a purple box of size 47x113 starting at (19, 89).
; PLAN: r0=179(x), r1=59(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x1), r6=147(y1), r7=251(x2), r8=17(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=89(y), r12=47(width), r13=113(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 59
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 147
LDI r7, 251
LDI r8, 17
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 89
LDI r12, 47
LDI r13, 113
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
