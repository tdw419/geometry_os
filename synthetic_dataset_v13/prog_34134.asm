; DESCRIPTION: Renders a magenta line between points (471, 208) and (184, 248).
; PLAN: r0=471(x1), r1=208(y1), r2=184(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 208
LDI r2, 184
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
