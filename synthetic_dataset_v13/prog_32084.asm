; DESCRIPTION: Draws a magenta line from (289, 211) to (122, 48).
; PLAN: r0=289(x1), r1=211(y1), r2=122(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 211
LDI r2, 122
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
