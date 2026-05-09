; DESCRIPTION: Draws a black line from (141, 152) to (356, 79).
; PLAN: r0=141(x1), r1=152(y1), r2=356(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 152
LDI r2, 356
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
