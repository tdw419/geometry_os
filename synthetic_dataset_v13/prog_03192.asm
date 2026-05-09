; DESCRIPTION: Renders a purple line between points (464, 103) and (330, 59).
; PLAN: r0=464(x1), r1=103(y1), r2=330(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 103
LDI r2, 330
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
