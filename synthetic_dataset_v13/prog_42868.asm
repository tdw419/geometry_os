; DESCRIPTION: Places a magenta line segment connecting (453, 4) to (210, 53).
; PLAN: r0=453(x1), r1=4(y1), r2=210(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 4
LDI r2, 210
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
