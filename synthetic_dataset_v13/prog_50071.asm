; DESCRIPTION: Composite: Renders a green box of size 43x18 starting at (178, 161) then Sets a single yellow pixel at (19, 53) then Renders a blue line between points (388, 47) and (490, 233).
; PLAN: r0=178(x), r1=161(y), r2=43(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=53(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=388(x1), r11=47(y1), r12=490(x2), r13=233(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 161
LDI r2, 43
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 53
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 388
LDI r11, 47
LDI r12, 490
LDI r13, 233
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
