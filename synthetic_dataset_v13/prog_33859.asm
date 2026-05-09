; DESCRIPTION: Renders a green line between points (453, 66) and (262, 151).
; PLAN: r0=453(x1), r1=66(y1), r2=262(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 66
LDI r2, 262
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
