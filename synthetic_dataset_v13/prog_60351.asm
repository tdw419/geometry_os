; DESCRIPTION: Places a magenta line segment connecting (217, 188) to (204, 217).
; PLAN: r0=217(x1), r1=188(y1), r2=204(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 188
LDI r2, 204
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
