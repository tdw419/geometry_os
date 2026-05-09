; DESCRIPTION: Renders a blue line between points (107, 68) and (433, 97).
; PLAN: r0=107(x1), r1=68(y1), r2=433(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 68
LDI r2, 433
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
