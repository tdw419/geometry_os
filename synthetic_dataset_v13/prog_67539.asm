; DESCRIPTION: Places a white line segment connecting (382, 5) to (132, 86).
; PLAN: r0=382(x1), r1=5(y1), r2=132(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 5
LDI r2, 132
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
