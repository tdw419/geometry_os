; DESCRIPTION: Places a black line segment connecting (330, 212) to (171, 229).
; PLAN: r0=330(x1), r1=212(y1), r2=171(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 212
LDI r2, 171
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
