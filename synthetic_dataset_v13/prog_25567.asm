; DESCRIPTION: Places a magenta line segment connecting (495, 131) to (228, 199).
; PLAN: r0=495(x1), r1=131(y1), r2=228(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 131
LDI r2, 228
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
