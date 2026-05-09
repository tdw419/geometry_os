; DESCRIPTION: Composite: Places a yellow 70x83 rectangle at position (65, 159) then Sets a single green pixel at (22, 35) then Renders a yellow line between points (108, 236) and (121, 2).
; PLAN: r0=65(x), r1=159(y), r2=70(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=22(x), r6=35(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=108(x1), r11=236(y1), r12=121(x2), r13=2(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 159
LDI r2, 70
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 35
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 108
LDI r11, 236
LDI r12, 121
LDI r13, 2
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
