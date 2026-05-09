; DESCRIPTION: Places a magenta line segment connecting (393, 12) to (199, 27).
; PLAN: r0=393(x1), r1=12(y1), r2=199(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 12
LDI r2, 199
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
