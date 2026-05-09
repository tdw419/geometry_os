; DESCRIPTION: Renders a magenta line between points (38, 246) and (58, 124).
; PLAN: r0=38(x1), r1=246(y1), r2=58(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 246
LDI r2, 58
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
