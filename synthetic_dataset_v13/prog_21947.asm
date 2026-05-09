; DESCRIPTION: Places a red line segment connecting (208, 87) to (506, 240).
; PLAN: r0=208(x1), r1=87(y1), r2=506(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 87
LDI r2, 506
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
