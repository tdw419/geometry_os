; DESCRIPTION: Renders a magenta line between points (285, 50) and (438, 62).
; PLAN: r0=285(x1), r1=50(y1), r2=438(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 50
LDI r2, 438
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
