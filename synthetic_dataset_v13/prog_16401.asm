; DESCRIPTION: Renders a blue line between points (326, 132) and (509, 251).
; PLAN: r0=326(x1), r1=132(y1), r2=509(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 132
LDI r2, 509
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
