; DESCRIPTION: Renders a cyan line between points (78, 9) and (476, 203).
; PLAN: r0=78(x1), r1=9(y1), r2=476(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 9
LDI r2, 476
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
