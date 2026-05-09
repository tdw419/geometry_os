; DESCRIPTION: Renders a blue line between points (6, 152) and (231, 120).
; PLAN: r0=6(x1), r1=152(y1), r2=231(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 152
LDI r2, 231
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
