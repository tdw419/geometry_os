; DESCRIPTION: Renders a magenta line between points (184, 226) and (229, 83).
; PLAN: r0=184(x1), r1=226(y1), r2=229(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 226
LDI r2, 229
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
