; DESCRIPTION: Renders a magenta line between points (98, 72) and (214, 110).
; PLAN: r0=98(x1), r1=72(y1), r2=214(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 72
LDI r2, 214
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
