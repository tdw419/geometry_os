; DESCRIPTION: Renders a blue line between points (190, 153) and (392, 169).
; PLAN: r0=190(x1), r1=153(y1), r2=392(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 153
LDI r2, 392
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
