; DESCRIPTION: Renders a magenta line between points (409, 179) and (273, 27).
; PLAN: r0=409(x1), r1=179(y1), r2=273(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 179
LDI r2, 273
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
