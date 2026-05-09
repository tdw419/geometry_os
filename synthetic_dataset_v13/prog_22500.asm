; DESCRIPTION: Renders a magenta line between points (229, 111) and (80, 249).
; PLAN: r0=229(x1), r1=111(y1), r2=80(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 111
LDI r2, 80
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
