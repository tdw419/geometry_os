; DESCRIPTION: Renders a magenta line between points (210, 41) and (466, 169).
; PLAN: r0=210(x1), r1=41(y1), r2=466(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 41
LDI r2, 466
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
