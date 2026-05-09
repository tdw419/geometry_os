; DESCRIPTION: Places a blue line segment connecting (8, 41) to (228, 181).
; PLAN: r0=8(x1), r1=41(y1), r2=228(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 41
LDI r2, 228
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
