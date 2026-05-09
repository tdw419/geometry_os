; DESCRIPTION: Places a cyan line segment connecting (182, 6) to (191, 119).
; PLAN: r0=182(x1), r1=6(y1), r2=191(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 6
LDI r2, 191
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
