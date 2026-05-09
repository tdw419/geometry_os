; DESCRIPTION: Renders a yellow line between points (169, 242) and (466, 180).
; PLAN: r0=169(x1), r1=242(y1), r2=466(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 242
LDI r2, 466
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
