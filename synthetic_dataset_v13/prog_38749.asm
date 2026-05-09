; DESCRIPTION: Composite: Places a orange dot at position (164, 217) then Renders a purple disk with center (223, 57) and radius 30 then Draws a black line from (505, 210) to (244, 37).
; PLAN: r0=164(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=57(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x1), r11=210(y1), r12=244(x2), r13=37(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 223
LDI r6, 57
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 210
LDI r12, 244
LDI r13, 37
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
