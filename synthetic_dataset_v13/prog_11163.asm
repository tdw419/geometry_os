; DESCRIPTION: Renders a magenta line between points (427, 215) and (292, 79).
; PLAN: r0=427(x1), r1=215(y1), r2=292(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 215
LDI r2, 292
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
