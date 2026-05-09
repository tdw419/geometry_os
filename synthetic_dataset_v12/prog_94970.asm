; DESCRIPTION: Places a magenta line segment connecting (334, 253) to (161, 253).
; PLAN: r0=334(x1), r1=253(y1), r2=161(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 253
LDI r2, 161
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
