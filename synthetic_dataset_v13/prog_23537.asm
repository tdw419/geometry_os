; DESCRIPTION: Places a black line segment connecting (280, 79) to (236, 169).
; PLAN: r0=280(x1), r1=79(y1), r2=236(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 79
LDI r2, 236
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
