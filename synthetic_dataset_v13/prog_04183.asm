; DESCRIPTION: Renders a magenta line between points (331, 58) and (69, 26).
; PLAN: r0=331(x1), r1=58(y1), r2=69(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 58
LDI r2, 69
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
