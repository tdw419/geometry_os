; DESCRIPTION: Places a magenta line segment connecting (24, 98) to (88, 187).
; PLAN: r0=24(x1), r1=98(y1), r2=88(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 98
LDI r2, 88
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
