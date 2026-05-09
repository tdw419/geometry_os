; DESCRIPTION: Places a yellow line segment connecting (486, 180) to (306, 13).
; PLAN: r0=486(x1), r1=180(y1), r2=306(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 180
LDI r2, 306
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
