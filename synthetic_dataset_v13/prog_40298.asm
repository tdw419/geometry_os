; DESCRIPTION: Places a black line segment connecting (466, 228) to (4, 252).
; PLAN: r0=466(x1), r1=228(y1), r2=4(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 228
LDI r2, 4
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
