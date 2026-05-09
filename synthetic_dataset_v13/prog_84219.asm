; DESCRIPTION: Places a cyan line segment connecting (72, 232) to (79, 45).
; PLAN: r0=72(x1), r1=232(y1), r2=79(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 232
LDI r2, 79
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
