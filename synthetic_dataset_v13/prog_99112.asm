; DESCRIPTION: Places a magenta line segment connecting (272, 41) to (453, 21).
; PLAN: r0=272(x1), r1=41(y1), r2=453(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 41
LDI r2, 453
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
