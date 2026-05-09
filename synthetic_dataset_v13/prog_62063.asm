; DESCRIPTION: Renders a magenta line between points (353, 13) and (218, 7).
; PLAN: r0=353(x1), r1=13(y1), r2=218(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 13
LDI r2, 218
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
