; DESCRIPTION: Places a purple line segment connecting (167, 153) to (146, 43).
; PLAN: r0=167(x1), r1=153(y1), r2=146(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 153
LDI r2, 146
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
