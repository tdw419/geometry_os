; DESCRIPTION: Places a magenta line segment connecting (270, 167) to (324, 173).
; PLAN: r0=270(x1), r1=167(y1), r2=324(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 167
LDI r2, 324
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
