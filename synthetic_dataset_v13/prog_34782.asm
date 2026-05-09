; DESCRIPTION: Draws a magenta line from (56, 193) to (171, 0).
; PLAN: r0=56(x1), r1=193(y1), r2=171(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 193
LDI r2, 171
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
