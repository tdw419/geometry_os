; DESCRIPTION: Places a yellow line segment connecting (1, 65) to (75, 134).
; PLAN: r0=1(x1), r1=65(y1), r2=75(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 65
LDI r2, 75
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
