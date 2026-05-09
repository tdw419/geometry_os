; DESCRIPTION: Renders a magenta line between points (394, 205) and (448, 130).
; PLAN: r0=394(x1), r1=205(y1), r2=448(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 205
LDI r2, 448
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
