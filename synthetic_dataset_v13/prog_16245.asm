; DESCRIPTION: Places a magenta line segment connecting (51, 180) to (291, 24).
; PLAN: r0=51(x1), r1=180(y1), r2=291(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 180
LDI r2, 291
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
