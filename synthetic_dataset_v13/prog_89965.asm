; DESCRIPTION: Places a cyan line segment connecting (120, 44) to (430, 1).
; PLAN: r0=120(x1), r1=44(y1), r2=430(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 44
LDI r2, 430
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
