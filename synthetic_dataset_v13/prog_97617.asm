; DESCRIPTION: Renders a magenta line between points (433, 153) and (249, 18).
; PLAN: r0=433(x1), r1=153(y1), r2=249(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 153
LDI r2, 249
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
