; DESCRIPTION: Places a magenta line segment connecting (250, 145) to (352, 236).
; PLAN: r0=250(x1), r1=145(y1), r2=352(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 145
LDI r2, 352
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
