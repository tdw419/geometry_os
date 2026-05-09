; DESCRIPTION: Draws a green line from (152, 136) to (77, 0).
; PLAN: r0=152(x1), r1=136(y1), r2=77(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 136
LDI r2, 77
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
