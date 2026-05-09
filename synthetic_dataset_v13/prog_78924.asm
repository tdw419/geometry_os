; DESCRIPTION: Renders a magenta line between points (457, 139) and (124, 113).
; PLAN: r0=457(x1), r1=139(y1), r2=124(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 139
LDI r2, 124
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
