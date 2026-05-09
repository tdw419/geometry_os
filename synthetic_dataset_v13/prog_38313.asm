; DESCRIPTION: Renders a magenta line between points (13, 58) and (329, 99).
; PLAN: r0=13(x1), r1=58(y1), r2=329(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 58
LDI r2, 329
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
