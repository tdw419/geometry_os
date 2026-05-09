; DESCRIPTION: Draws a red line from (453, 9) to (259, 48).
; PLAN: r0=453(x1), r1=9(y1), r2=259(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 9
LDI r2, 259
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
