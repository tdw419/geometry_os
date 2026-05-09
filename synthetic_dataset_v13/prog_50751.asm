; DESCRIPTION: Renders a yellow line between points (356, 174) and (259, 68).
; PLAN: r0=356(x1), r1=174(y1), r2=259(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 174
LDI r2, 259
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
