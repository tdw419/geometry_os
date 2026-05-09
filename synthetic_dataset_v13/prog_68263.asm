; DESCRIPTION: Places a cyan line segment connecting (2, 66) to (223, 140).
; PLAN: r0=2(x1), r1=66(y1), r2=223(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 66
LDI r2, 223
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
