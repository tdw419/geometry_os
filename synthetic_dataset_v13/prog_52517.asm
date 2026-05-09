; DESCRIPTION: Renders a black line between points (99, 146) and (511, 222).
; PLAN: r0=99(x1), r1=146(y1), r2=511(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 146
LDI r2, 511
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
