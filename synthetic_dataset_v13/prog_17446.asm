; DESCRIPTION: Places a blue line segment connecting (136, 228) to (132, 169).
; PLAN: r0=136(x1), r1=228(y1), r2=132(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 228
LDI r2, 132
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
