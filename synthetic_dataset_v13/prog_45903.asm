; DESCRIPTION: Places a magenta line segment connecting (422, 47) to (27, 214).
; PLAN: r0=422(x1), r1=47(y1), r2=27(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 47
LDI r2, 27
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
