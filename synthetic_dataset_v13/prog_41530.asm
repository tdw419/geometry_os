; DESCRIPTION: Places a magenta line segment connecting (199, 106) to (141, 113).
; PLAN: r0=199(x1), r1=106(y1), r2=141(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 106
LDI r2, 141
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
