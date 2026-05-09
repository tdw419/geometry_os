; DESCRIPTION: Places a cyan line segment connecting (501, 155) to (51, 32).
; PLAN: r0=501(x1), r1=155(y1), r2=51(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 155
LDI r2, 51
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
