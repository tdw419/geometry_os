; DESCRIPTION: Draws a green line from (331, 118) to (464, 103).
; PLAN: r0=331(x1), r1=118(y1), r2=464(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 118
LDI r2, 464
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
