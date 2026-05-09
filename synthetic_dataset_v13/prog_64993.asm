; DESCRIPTION: Places a white line segment connecting (236, 116) to (65, 169).
; PLAN: r0=236(x1), r1=116(y1), r2=65(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 116
LDI r2, 65
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
