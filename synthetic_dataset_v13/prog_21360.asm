; DESCRIPTION: Renders a magenta line between points (251, 48) and (130, 161).
; PLAN: r0=251(x1), r1=48(y1), r2=130(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 48
LDI r2, 130
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
