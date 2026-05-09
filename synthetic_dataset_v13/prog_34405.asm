; DESCRIPTION: Renders a black line between points (366, 33) and (1, 165).
; PLAN: r0=366(x1), r1=33(y1), r2=1(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 33
LDI r2, 1
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
