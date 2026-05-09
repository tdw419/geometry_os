; DESCRIPTION: Places a magenta line segment connecting (502, 18) to (199, 212).
; PLAN: r0=502(x1), r1=18(y1), r2=199(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 18
LDI r2, 199
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
