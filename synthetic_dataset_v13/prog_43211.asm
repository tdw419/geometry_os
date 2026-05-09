; DESCRIPTION: Renders a magenta line between points (79, 154) and (509, 180).
; PLAN: r0=79(x1), r1=154(y1), r2=509(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 154
LDI r2, 509
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
