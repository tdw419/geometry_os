; DESCRIPTION: Places a cyan line segment connecting (424, 7) to (78, 141).
; PLAN: r0=424(x1), r1=7(y1), r2=78(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 7
LDI r2, 78
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
