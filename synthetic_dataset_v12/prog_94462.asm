; DESCRIPTION: Renders a black line between points (1, 122) and (428, 46).
; PLAN: r0=1(x1), r1=122(y1), r2=428(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 122
LDI r2, 428
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
