; DESCRIPTION: Draws a black line from (503, 253) to (503, 22).
; PLAN: r0=503(x1), r1=253(y1), r2=503(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 253
LDI r2, 503
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
