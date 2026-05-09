; DESCRIPTION: Renders a cyan line between points (383, 72) and (56, 110).
; PLAN: r0=383(x1), r1=72(y1), r2=56(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 72
LDI r2, 56
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
