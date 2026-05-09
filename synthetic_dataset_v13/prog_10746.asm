; DESCRIPTION: Draws a blue line from (483, 152) to (1, 8).
; PLAN: r0=483(x1), r1=152(y1), r2=1(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 152
LDI r2, 1
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
