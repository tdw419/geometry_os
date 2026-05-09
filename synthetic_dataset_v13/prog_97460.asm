; DESCRIPTION: Places a magenta line segment connecting (491, 173) to (247, 234).
; PLAN: r0=491(x1), r1=173(y1), r2=247(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 173
LDI r2, 247
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
