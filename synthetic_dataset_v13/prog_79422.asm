; DESCRIPTION: Places a black line segment connecting (195, 208) to (465, 36).
; PLAN: r0=195(x1), r1=208(y1), r2=465(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 208
LDI r2, 465
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
