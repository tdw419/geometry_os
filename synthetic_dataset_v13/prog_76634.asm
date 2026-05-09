; DESCRIPTION: Places a red line segment connecting (240, 253) to (444, 51).
; PLAN: r0=240(x1), r1=253(y1), r2=444(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 253
LDI r2, 444
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
