; DESCRIPTION: Composite: Places a white circle of radius 35 at center (71, 135) then Places a blue dot at position (396, 185) then Places a red line segment connecting (164, 70) to (352, 222).
; PLAN: r0=71(x), r1=135(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=185(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=164(x1), r11=70(y1), r12=352(x2), r13=222(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 135
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 185
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 164
LDI r11, 70
LDI r12, 352
LDI r13, 222
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
