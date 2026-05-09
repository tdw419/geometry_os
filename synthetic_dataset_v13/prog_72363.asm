; DESCRIPTION: Renders a green line between points (465, 184) and (356, 72).
; PLAN: r0=465(x1), r1=184(y1), r2=356(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 184
LDI r2, 356
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
