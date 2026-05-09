; DESCRIPTION: Places a magenta line segment connecting (194, 161) to (243, 55).
; PLAN: r0=194(x1), r1=161(y1), r2=243(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 161
LDI r2, 243
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
