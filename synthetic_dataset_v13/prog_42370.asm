; DESCRIPTION: Renders a magenta line between points (358, 244) and (47, 214).
; PLAN: r0=358(x1), r1=244(y1), r2=47(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 244
LDI r2, 47
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
