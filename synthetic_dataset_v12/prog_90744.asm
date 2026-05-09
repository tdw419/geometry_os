; DESCRIPTION: Renders a magenta line between points (471, 201) and (410, 83).
; PLAN: r0=471(x1), r1=201(y1), r2=410(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 201
LDI r2, 410
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
