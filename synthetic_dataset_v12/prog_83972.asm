; DESCRIPTION: Places a cyan line segment connecting (324, 113) to (44, 5).
; PLAN: r0=324(x1), r1=113(y1), r2=44(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 113
LDI r2, 44
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
