; DESCRIPTION: Renders a magenta line between points (434, 229) and (330, 79).
; PLAN: r0=434(x1), r1=229(y1), r2=330(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 229
LDI r2, 330
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
