; DESCRIPTION: Places a magenta line segment connecting (124, 79) to (180, 117).
; PLAN: r0=124(x1), r1=79(y1), r2=180(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 79
LDI r2, 180
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
