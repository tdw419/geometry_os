; DESCRIPTION: Places a cyan line segment connecting (95, 220) to (508, 72).
; PLAN: r0=95(x1), r1=220(y1), r2=508(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 220
LDI r2, 508
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
