; DESCRIPTION: Places a magenta line segment connecting (53, 246) to (392, 69).
; PLAN: r0=53(x1), r1=246(y1), r2=392(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 246
LDI r2, 392
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
