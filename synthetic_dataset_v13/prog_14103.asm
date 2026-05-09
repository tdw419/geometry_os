; DESCRIPTION: Draws a magenta line from (504, 169) to (474, 156).
; PLAN: r0=504(x1), r1=169(y1), r2=474(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 169
LDI r2, 474
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
