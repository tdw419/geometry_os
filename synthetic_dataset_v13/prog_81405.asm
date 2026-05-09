; DESCRIPTION: Draws a magenta line from (265, 120) to (144, 79).
; PLAN: r0=265(x1), r1=120(y1), r2=144(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 120
LDI r2, 144
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
