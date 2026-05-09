; DESCRIPTION: Composite: Renders a cyan box of size 59x22 starting at (91, 18) then Places a green dot at position (478, 122) then Renders a yellow line between points (492, 147) and (454, 241).
; PLAN: r0=91(x), r1=18(y), r2=59(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=122(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=492(x1), r11=147(y1), r12=454(x2), r13=241(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 18
LDI r2, 59
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 122
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 492
LDI r11, 147
LDI r12, 454
LDI r13, 241
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
