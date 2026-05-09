; DESCRIPTION: Places a magenta line segment connecting (398, 210) to (301, 77).
; PLAN: r0=398(x1), r1=210(y1), r2=301(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 210
LDI r2, 301
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
