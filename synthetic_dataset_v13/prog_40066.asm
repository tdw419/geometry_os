; DESCRIPTION: Renders a purple line between points (464, 117) and (24, 208).
; PLAN: r0=464(x1), r1=117(y1), r2=24(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 117
LDI r2, 24
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
