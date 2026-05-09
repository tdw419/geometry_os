; DESCRIPTION: Places a blue line segment connecting (306, 210) to (126, 15).
; PLAN: r0=306(x1), r1=210(y1), r2=126(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 210
LDI r2, 126
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
