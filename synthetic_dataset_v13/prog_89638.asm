; DESCRIPTION: Places a red line segment connecting (177, 154) to (356, 96).
; PLAN: r0=177(x1), r1=154(y1), r2=356(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 154
LDI r2, 356
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
