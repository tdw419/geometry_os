; DESCRIPTION: Places a magenta line segment connecting (152, 60) to (80, 37).
; PLAN: r0=152(x1), r1=60(y1), r2=80(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 60
LDI r2, 80
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
