; DESCRIPTION: Draws a black line from (481, 44) to (389, 48).
; PLAN: r0=481(x1), r1=44(y1), r2=389(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 44
LDI r2, 389
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
