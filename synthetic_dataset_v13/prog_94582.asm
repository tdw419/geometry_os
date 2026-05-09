; DESCRIPTION: Renders a yellow line between points (488, 227) and (288, 76).
; PLAN: r0=488(x1), r1=227(y1), r2=288(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 227
LDI r2, 288
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
