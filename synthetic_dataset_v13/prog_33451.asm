; DESCRIPTION: Draws a magenta line from (503, 183) to (470, 12).
; PLAN: r0=503(x1), r1=183(y1), r2=470(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 183
LDI r2, 470
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
