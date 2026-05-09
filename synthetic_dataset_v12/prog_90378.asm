; DESCRIPTION: Places a black line segment connecting (90, 109) to (363, 173).
; PLAN: r0=90(x1), r1=109(y1), r2=363(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 109
LDI r2, 363
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
