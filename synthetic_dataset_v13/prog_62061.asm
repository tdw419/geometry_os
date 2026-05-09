; DESCRIPTION: Renders a magenta line between points (340, 162) and (503, 209).
; PLAN: r0=340(x1), r1=162(y1), r2=503(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 162
LDI r2, 503
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
