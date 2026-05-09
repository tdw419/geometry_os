; DESCRIPTION: Places a black line segment connecting (46, 90) to (167, 135).
; PLAN: r0=46(x1), r1=90(y1), r2=167(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 90
LDI r2, 167
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
