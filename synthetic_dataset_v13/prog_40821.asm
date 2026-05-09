; DESCRIPTION: Renders a magenta line between points (217, 238) and (252, 160).
; PLAN: r0=217(x1), r1=238(y1), r2=252(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 238
LDI r2, 252
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
