; DESCRIPTION: Draws a black line from (249, 69) to (99, 124).
; PLAN: r0=249(x1), r1=69(y1), r2=99(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 69
LDI r2, 99
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
