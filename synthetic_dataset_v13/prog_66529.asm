; DESCRIPTION: Places a magenta line segment connecting (421, 174) to (121, 133).
; PLAN: r0=421(x1), r1=174(y1), r2=121(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 174
LDI r2, 121
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
