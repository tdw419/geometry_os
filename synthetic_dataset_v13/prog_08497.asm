; DESCRIPTION: Draws a red line from (110, 189) to (356, 249).
; PLAN: r0=110(x1), r1=189(y1), r2=356(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 189
LDI r2, 356
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
