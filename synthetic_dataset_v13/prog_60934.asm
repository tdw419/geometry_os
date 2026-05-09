; DESCRIPTION: Renders a magenta line between points (336, 124) and (71, 200).
; PLAN: r0=336(x1), r1=124(y1), r2=71(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 124
LDI r2, 71
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
