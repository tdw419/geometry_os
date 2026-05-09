; DESCRIPTION: Renders a magenta line between points (329, 219) and (404, 196).
; PLAN: r0=329(x1), r1=219(y1), r2=404(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 219
LDI r2, 404
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
