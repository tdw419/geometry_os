; DESCRIPTION: Renders a cyan line between points (452, 95) and (390, 110).
; PLAN: r0=452(x1), r1=95(y1), r2=390(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 95
LDI r2, 390
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
