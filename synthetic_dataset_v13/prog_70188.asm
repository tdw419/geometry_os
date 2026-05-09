; DESCRIPTION: Places a magenta line segment connecting (508, 173) to (34, 126).
; PLAN: r0=508(x1), r1=173(y1), r2=34(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 173
LDI r2, 34
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
