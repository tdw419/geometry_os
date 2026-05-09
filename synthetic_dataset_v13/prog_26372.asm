; DESCRIPTION: Renders a magenta line between points (370, 156) and (475, 152).
; PLAN: r0=370(x1), r1=156(y1), r2=475(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 156
LDI r2, 475
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
