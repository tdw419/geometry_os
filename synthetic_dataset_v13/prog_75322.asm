; DESCRIPTION: Renders a purple line between points (439, 63) and (25, 171).
; PLAN: r0=439(x1), r1=63(y1), r2=25(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 63
LDI r2, 25
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
