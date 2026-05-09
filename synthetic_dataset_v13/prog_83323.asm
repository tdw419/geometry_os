; DESCRIPTION: Renders a purple line between points (464, 65) and (150, 46).
; PLAN: r0=464(x1), r1=65(y1), r2=150(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 65
LDI r2, 150
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
