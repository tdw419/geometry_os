; DESCRIPTION: Places a magenta line segment connecting (365, 146) to (84, 0).
; PLAN: r0=365(x1), r1=146(y1), r2=84(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 146
LDI r2, 84
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
