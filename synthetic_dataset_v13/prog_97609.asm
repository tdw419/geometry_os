; DESCRIPTION: Renders a black line between points (288, 225) and (76, 166).
; PLAN: r0=288(x1), r1=225(y1), r2=76(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 225
LDI r2, 76
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
