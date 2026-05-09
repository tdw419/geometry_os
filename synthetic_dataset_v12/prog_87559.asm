; DESCRIPTION: Places a red line segment connecting (367, 29) to (48, 205).
; PLAN: r0=367(x1), r1=29(y1), r2=48(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 29
LDI r2, 48
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
