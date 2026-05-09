; DESCRIPTION: Places a magenta line segment connecting (108, 189) to (246, 225).
; PLAN: r0=108(x1), r1=189(y1), r2=246(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 189
LDI r2, 246
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
