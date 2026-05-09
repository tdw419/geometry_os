; DESCRIPTION: Renders a green line between points (428, 80) and (8, 134).
; PLAN: r0=428(x1), r1=80(y1), r2=8(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 80
LDI r2, 8
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
