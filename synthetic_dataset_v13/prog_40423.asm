; DESCRIPTION: Renders a magenta line between points (103, 44) and (389, 236).
; PLAN: r0=103(x1), r1=44(y1), r2=389(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 44
LDI r2, 389
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
