; DESCRIPTION: Renders a green line between points (426, 140) and (356, 97).
; PLAN: r0=426(x1), r1=140(y1), r2=356(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 140
LDI r2, 356
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
