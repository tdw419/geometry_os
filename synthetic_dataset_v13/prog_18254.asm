; DESCRIPTION: Draws a green line from (47, 152) to (335, 85).
; PLAN: r0=47(x1), r1=152(y1), r2=335(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 152
LDI r2, 335
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
