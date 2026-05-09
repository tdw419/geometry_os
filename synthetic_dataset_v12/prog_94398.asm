; DESCRIPTION: Draws a magenta line from (365, 75) to (130, 133).
; PLAN: r0=365(x1), r1=75(y1), r2=130(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 75
LDI r2, 130
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
