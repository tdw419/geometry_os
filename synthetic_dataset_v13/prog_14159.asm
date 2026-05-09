; DESCRIPTION: Renders a yellow line between points (450, 203) and (135, 196).
; PLAN: r0=450(x1), r1=203(y1), r2=135(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 203
LDI r2, 135
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
