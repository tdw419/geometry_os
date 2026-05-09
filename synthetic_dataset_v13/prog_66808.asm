; DESCRIPTION: Places a red line segment connecting (57, 1) to (188, 134).
; PLAN: r0=57(x1), r1=1(y1), r2=188(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 1
LDI r2, 188
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
