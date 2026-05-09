; DESCRIPTION: Renders a black line between points (202, 167) and (395, 155).
; PLAN: r0=202(x1), r1=167(y1), r2=395(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 167
LDI r2, 395
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
