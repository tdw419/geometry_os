; DESCRIPTION: Renders a magenta line between points (361, 104) and (317, 26).
; PLAN: r0=361(x1), r1=104(y1), r2=317(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 104
LDI r2, 317
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
