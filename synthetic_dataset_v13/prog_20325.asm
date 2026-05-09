; DESCRIPTION: Places a magenta line segment connecting (268, 20) to (421, 214).
; PLAN: r0=268(x1), r1=20(y1), r2=421(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 20
LDI r2, 421
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
