; DESCRIPTION: Places a red line segment connecting (275, 81) to (45, 142).
; PLAN: r0=275(x1), r1=81(y1), r2=45(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 81
LDI r2, 45
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
