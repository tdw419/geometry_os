; DESCRIPTION: Renders a magenta line between points (503, 69) and (248, 25).
; PLAN: r0=503(x1), r1=69(y1), r2=248(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 69
LDI r2, 248
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
