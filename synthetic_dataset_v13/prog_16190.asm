; DESCRIPTION: Renders a orange line between points (356, 11) and (187, 177).
; PLAN: r0=356(x1), r1=11(y1), r2=187(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 11
LDI r2, 187
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
