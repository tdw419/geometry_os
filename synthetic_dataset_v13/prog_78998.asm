; DESCRIPTION: Places a magenta line segment connecting (167, 117) to (209, 81).
; PLAN: r0=167(x1), r1=117(y1), r2=209(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 117
LDI r2, 209
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
