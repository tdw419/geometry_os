; DESCRIPTION: Renders a magenta line between points (171, 160) and (413, 232).
; PLAN: r0=171(x1), r1=160(y1), r2=413(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 160
LDI r2, 413
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
