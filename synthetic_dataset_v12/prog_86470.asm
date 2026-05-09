; DESCRIPTION: Renders a green line between points (54, 152) and (133, 127).
; PLAN: r0=54(x1), r1=152(y1), r2=133(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 152
LDI r2, 133
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
