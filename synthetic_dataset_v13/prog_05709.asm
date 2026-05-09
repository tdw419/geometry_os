; DESCRIPTION: Places a cyan line segment connecting (343, 9) to (404, 99).
; PLAN: r0=343(x1), r1=9(y1), r2=404(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 9
LDI r2, 404
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
