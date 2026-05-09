; DESCRIPTION: Renders a magenta line between points (205, 62) and (418, 250).
; PLAN: r0=205(x1), r1=62(y1), r2=418(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 62
LDI r2, 418
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
