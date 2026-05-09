; DESCRIPTION: Renders a green line between points (44, 153) and (121, 97).
; PLAN: r0=44(x1), r1=153(y1), r2=121(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 153
LDI r2, 121
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
