; DESCRIPTION: Renders a magenta line between points (34, 48) and (332, 176).
; PLAN: r0=34(x1), r1=48(y1), r2=332(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 48
LDI r2, 332
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
