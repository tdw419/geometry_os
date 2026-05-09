; DESCRIPTION: Renders a magenta line between points (381, 31) and (23, 34).
; PLAN: r0=381(x1), r1=31(y1), r2=23(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 31
LDI r2, 23
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
