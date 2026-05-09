; DESCRIPTION: Places a blue line segment connecting (207, 233) to (464, 176).
; PLAN: r0=207(x1), r1=233(y1), r2=464(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 233
LDI r2, 464
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
