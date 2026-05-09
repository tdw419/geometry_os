; DESCRIPTION: Places a purple line segment connecting (450, 209) to (180, 41).
; PLAN: r0=450(x1), r1=209(y1), r2=180(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 209
LDI r2, 180
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
