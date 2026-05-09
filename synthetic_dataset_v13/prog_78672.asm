; DESCRIPTION: Renders a red line between points (356, 64) and (453, 214).
; PLAN: r0=356(x1), r1=64(y1), r2=453(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 64
LDI r2, 453
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
