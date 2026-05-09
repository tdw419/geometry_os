; DESCRIPTION: Renders a purple line between points (101, 223) and (460, 152).
; PLAN: r0=101(x1), r1=223(y1), r2=460(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 223
LDI r2, 460
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
