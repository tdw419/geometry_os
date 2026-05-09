; DESCRIPTION: Renders a magenta line between points (363, 226) and (180, 128).
; PLAN: r0=363(x1), r1=226(y1), r2=180(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 226
LDI r2, 180
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
