; DESCRIPTION: Places a yellow line segment connecting (392, 125) to (250, 176).
; PLAN: r0=392(x1), r1=125(y1), r2=250(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 125
LDI r2, 250
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
