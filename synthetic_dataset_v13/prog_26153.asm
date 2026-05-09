; DESCRIPTION: Places a magenta line segment connecting (435, 187) to (24, 24).
; PLAN: r0=435(x1), r1=187(y1), r2=24(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 187
LDI r2, 24
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
