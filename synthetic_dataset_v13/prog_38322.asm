; DESCRIPTION: Places a magenta line segment connecting (448, 180) to (295, 210).
; PLAN: r0=448(x1), r1=180(y1), r2=295(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 180
LDI r2, 295
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
