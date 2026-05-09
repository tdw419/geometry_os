; DESCRIPTION: Composite: Draws a red line from (121, 37) to (216, 70) then Places a red dot at position (502, 191) then Draws a yellow circle centered at (49, 160) with radius 23.
; PLAN: r0=121(x1), r1=37(y1), r2=216(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=502(x), r6=191(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=49(x), r11=160(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 37
LDI r2, 216
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 191
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 49
LDI r11, 160
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
