; DESCRIPTION: Renders a black line between points (306, 189) and (101, 210).
; PLAN: r0=306(x1), r1=189(y1), r2=101(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 189
LDI r2, 101
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
