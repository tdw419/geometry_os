; DESCRIPTION: Renders a magenta line between points (251, 188) and (79, 152).
; PLAN: r0=251(x1), r1=188(y1), r2=79(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 188
LDI r2, 79
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
