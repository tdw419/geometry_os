; DESCRIPTION: Places a red line segment connecting (470, 19) to (23, 65).
; PLAN: r0=470(x1), r1=19(y1), r2=23(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 19
LDI r2, 23
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
