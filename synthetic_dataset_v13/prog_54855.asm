; DESCRIPTION: Places a red line segment connecting (130, 48) to (80, 86).
; PLAN: r0=130(x1), r1=48(y1), r2=80(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 48
LDI r2, 80
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
