; DESCRIPTION: Renders a yellow line between points (262, 124) and (352, 84).
; PLAN: r0=262(x1), r1=124(y1), r2=352(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 124
LDI r2, 352
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
