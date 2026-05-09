; DESCRIPTION: Renders a blue line between points (325, 103) and (330, 21).
; PLAN: r0=325(x1), r1=103(y1), r2=330(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 103
LDI r2, 330
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
