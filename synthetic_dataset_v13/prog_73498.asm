; DESCRIPTION: Renders a yellow line between points (196, 135) and (82, 56).
; PLAN: r0=196(x1), r1=135(y1), r2=82(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 135
LDI r2, 82
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
