; DESCRIPTION: Places a magenta line segment connecting (385, 19) to (306, 134).
; PLAN: r0=385(x1), r1=19(y1), r2=306(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 19
LDI r2, 306
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
