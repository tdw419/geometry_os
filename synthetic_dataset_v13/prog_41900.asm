; DESCRIPTION: Places a red line segment connecting (208, 130) to (34, 127).
; PLAN: r0=208(x1), r1=130(y1), r2=34(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 130
LDI r2, 34
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
