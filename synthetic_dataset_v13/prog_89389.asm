; DESCRIPTION: Places a purple line segment connecting (470, 41) to (222, 228).
; PLAN: r0=470(x1), r1=41(y1), r2=222(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 41
LDI r2, 222
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
