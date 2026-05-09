; DESCRIPTION: Places a magenta line segment connecting (165, 176) to (245, 134).
; PLAN: r0=165(x1), r1=176(y1), r2=245(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 176
LDI r2, 245
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
