; DESCRIPTION: Renders a red line between points (356, 153) and (432, 171).
; PLAN: r0=356(x1), r1=153(y1), r2=432(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 153
LDI r2, 432
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
