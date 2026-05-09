; DESCRIPTION: Places a cyan line segment connecting (272, 9) to (377, 124).
; PLAN: r0=272(x1), r1=9(y1), r2=377(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 9
LDI r2, 377
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
