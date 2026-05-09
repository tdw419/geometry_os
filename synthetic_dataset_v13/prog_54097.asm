; DESCRIPTION: Renders a magenta line between points (268, 200) and (139, 16).
; PLAN: r0=268(x1), r1=200(y1), r2=139(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 200
LDI r2, 139
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
