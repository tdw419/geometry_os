; DESCRIPTION: Places a magenta line segment connecting (21, 79) to (380, 135).
; PLAN: r0=21(x1), r1=79(y1), r2=380(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 79
LDI r2, 380
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
