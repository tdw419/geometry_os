; DESCRIPTION: Places a magenta line segment connecting (55, 47) to (224, 44).
; PLAN: r0=55(x1), r1=47(y1), r2=224(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 47
LDI r2, 224
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
