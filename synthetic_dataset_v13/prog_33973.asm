; DESCRIPTION: Places a magenta line segment connecting (108, 176) to (197, 211).
; PLAN: r0=108(x1), r1=176(y1), r2=197(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 176
LDI r2, 197
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
