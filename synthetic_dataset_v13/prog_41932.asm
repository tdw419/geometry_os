; DESCRIPTION: Places a red line segment connecting (1, 253) to (45, 237).
; PLAN: r0=1(x1), r1=253(y1), r2=45(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 253
LDI r2, 45
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
