; DESCRIPTION: Places a black line segment connecting (342, 253) to (270, 234).
; PLAN: r0=342(x1), r1=253(y1), r2=270(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 253
LDI r2, 270
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
