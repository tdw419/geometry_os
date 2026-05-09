; DESCRIPTION: Places a magenta line segment connecting (48, 41) to (238, 109).
; PLAN: r0=48(x1), r1=41(y1), r2=238(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 41
LDI r2, 238
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
