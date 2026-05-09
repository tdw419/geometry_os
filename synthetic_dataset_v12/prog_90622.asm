; DESCRIPTION: Places a red line segment connecting (260, 31) to (300, 132).
; PLAN: r0=260(x1), r1=31(y1), r2=300(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 31
LDI r2, 300
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
