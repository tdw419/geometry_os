; DESCRIPTION: Renders a magenta line between points (221, 148) and (172, 231).
; PLAN: r0=221(x1), r1=148(y1), r2=172(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 148
LDI r2, 172
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
