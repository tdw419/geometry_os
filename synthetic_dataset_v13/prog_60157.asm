; DESCRIPTION: Places a magenta line segment connecting (53, 226) to (152, 55).
; PLAN: r0=53(x1), r1=226(y1), r2=152(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 226
LDI r2, 152
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
