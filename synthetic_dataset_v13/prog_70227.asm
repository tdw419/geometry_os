; DESCRIPTION: Places a magenta line segment connecting (217, 53) to (161, 183).
; PLAN: r0=217(x1), r1=53(y1), r2=161(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 53
LDI r2, 161
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
