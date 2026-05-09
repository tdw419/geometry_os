; DESCRIPTION: Places a cyan line segment connecting (429, 47) to (4, 114).
; PLAN: r0=429(x1), r1=47(y1), r2=4(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 47
LDI r2, 4
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
