; DESCRIPTION: Places a red line segment connecting (160, 167) to (435, 132).
; PLAN: r0=160(x1), r1=167(y1), r2=435(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 167
LDI r2, 435
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
