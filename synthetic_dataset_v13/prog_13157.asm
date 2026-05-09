; DESCRIPTION: Places a magenta line segment connecting (167, 56) to (430, 213).
; PLAN: r0=167(x1), r1=56(y1), r2=430(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 56
LDI r2, 430
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
