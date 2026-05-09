; DESCRIPTION: Renders a cyan line between points (250, 170) and (100, 120).
; PLAN: r0=250(x1), r1=170(y1), r2=100(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 170
LDI r2, 100
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
