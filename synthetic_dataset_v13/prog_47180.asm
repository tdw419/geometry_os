; DESCRIPTION: Renders a red line between points (277, 194) and (196, 135).
; PLAN: r0=277(x1), r1=194(y1), r2=196(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 194
LDI r2, 196
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
