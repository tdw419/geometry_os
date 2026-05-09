; DESCRIPTION: Places a magenta line segment connecting (398, 112) to (156, 51).
; PLAN: r0=398(x1), r1=112(y1), r2=156(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 112
LDI r2, 156
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
