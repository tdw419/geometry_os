; DESCRIPTION: Renders a orange line between points (16, 179) and (322, 156).
; PLAN: r0=16(x1), r1=179(y1), r2=322(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 179
LDI r2, 322
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
