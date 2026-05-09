; DESCRIPTION: Places a black line segment connecting (281, 2) to (208, 180).
; PLAN: r0=281(x1), r1=2(y1), r2=208(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 2
LDI r2, 208
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
