; DESCRIPTION: Places a magenta line segment connecting (193, 213) to (495, 205).
; PLAN: r0=193(x1), r1=213(y1), r2=495(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 213
LDI r2, 495
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
