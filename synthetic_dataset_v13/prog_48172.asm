; DESCRIPTION: Places a magenta line segment connecting (117, 195) to (18, 34).
; PLAN: r0=117(x1), r1=195(y1), r2=18(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 195
LDI r2, 18
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
