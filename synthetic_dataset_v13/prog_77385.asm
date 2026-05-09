; DESCRIPTION: Renders a magenta line between points (124, 104) and (18, 40).
; PLAN: r0=124(x1), r1=104(y1), r2=18(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 104
LDI r2, 18
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
