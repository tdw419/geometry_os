; DESCRIPTION: Places a white line segment connecting (267, 132) to (492, 44).
; PLAN: r0=267(x1), r1=132(y1), r2=492(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 132
LDI r2, 492
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
