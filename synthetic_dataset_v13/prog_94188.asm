; DESCRIPTION: Renders a magenta line between points (214, 155) and (206, 188).
; PLAN: r0=214(x1), r1=155(y1), r2=206(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 155
LDI r2, 206
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
