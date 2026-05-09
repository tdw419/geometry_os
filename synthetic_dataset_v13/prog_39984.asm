; DESCRIPTION: Renders a black line between points (362, 9) and (73, 153).
; PLAN: r0=362(x1), r1=9(y1), r2=73(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 9
LDI r2, 73
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
