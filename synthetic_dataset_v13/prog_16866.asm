; DESCRIPTION: Draws a green line from (464, 142) to (453, 220).
; PLAN: r0=464(x1), r1=142(y1), r2=453(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 142
LDI r2, 453
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
