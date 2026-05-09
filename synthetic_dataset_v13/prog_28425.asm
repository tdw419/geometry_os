; DESCRIPTION: Places a magenta line segment connecting (382, 41) to (176, 89).
; PLAN: r0=382(x1), r1=41(y1), r2=176(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 41
LDI r2, 176
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
