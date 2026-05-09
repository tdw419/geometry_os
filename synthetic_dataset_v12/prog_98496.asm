; DESCRIPTION: Places a green line segment connecting (267, 174) to (50, 250).
; PLAN: r0=267(x1), r1=174(y1), r2=50(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 174
LDI r2, 50
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
