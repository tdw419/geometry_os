; DESCRIPTION: Draws a green line from (169, 193) to (503, 152).
; PLAN: r0=169(x1), r1=193(y1), r2=503(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 193
LDI r2, 503
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
