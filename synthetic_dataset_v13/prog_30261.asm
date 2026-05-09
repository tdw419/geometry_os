; DESCRIPTION: Places a magenta line segment connecting (33, 249) to (400, 214).
; PLAN: r0=33(x1), r1=249(y1), r2=400(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 249
LDI r2, 400
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
