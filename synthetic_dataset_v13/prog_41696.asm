; DESCRIPTION: Places a green line segment connecting (278, 176) to (267, 229).
; PLAN: r0=278(x1), r1=176(y1), r2=267(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 176
LDI r2, 267
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
