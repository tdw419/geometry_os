; DESCRIPTION: Renders a magenta line between points (407, 5) and (418, 91).
; PLAN: r0=407(x1), r1=5(y1), r2=418(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 5
LDI r2, 418
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
