; DESCRIPTION: Composite: Renders a purple disk with center (313, 69) and radius 31 then Renders a orange line between points (216, 83) and (416, 63) then Places a blue dot at position (333, 87).
; PLAN: r0=313(x), r1=69(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x1), r6=83(y1), r7=416(x2), r8=63(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=87(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 69
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 83
LDI r7, 416
LDI r8, 63
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 87
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
