; DESCRIPTION: Renders a magenta line between points (329, 53) and (203, 44).
; PLAN: r0=329(x1), r1=53(y1), r2=203(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 53
LDI r2, 203
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
