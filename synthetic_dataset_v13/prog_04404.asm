; DESCRIPTION: Places a cyan line segment connecting (430, 79) to (51, 212).
; PLAN: r0=430(x1), r1=79(y1), r2=51(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 79
LDI r2, 51
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
