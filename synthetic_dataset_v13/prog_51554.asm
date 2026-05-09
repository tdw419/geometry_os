; DESCRIPTION: Places a cyan line segment connecting (205, 40) to (75, 33).
; PLAN: r0=205(x1), r1=40(y1), r2=75(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 40
LDI r2, 75
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
