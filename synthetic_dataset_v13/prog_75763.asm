; DESCRIPTION: Renders a black line between points (100, 127) and (187, 112).
; PLAN: r0=100(x1), r1=127(y1), r2=187(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 127
LDI r2, 187
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
