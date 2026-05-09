; DESCRIPTION: Places a cyan line segment connecting (437, 113) to (77, 196).
; PLAN: r0=437(x1), r1=113(y1), r2=77(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 113
LDI r2, 77
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
