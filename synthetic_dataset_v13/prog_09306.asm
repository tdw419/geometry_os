; DESCRIPTION: Draws a red line from (393, 196) to (10, 79).
; PLAN: r0=393(x1), r1=196(y1), r2=10(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 196
LDI r2, 10
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
