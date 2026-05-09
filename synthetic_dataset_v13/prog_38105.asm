; DESCRIPTION: Places a magenta line segment connecting (164, 173) to (322, 5).
; PLAN: r0=164(x1), r1=173(y1), r2=322(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 173
LDI r2, 322
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
