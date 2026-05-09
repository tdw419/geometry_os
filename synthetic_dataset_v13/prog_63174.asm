; DESCRIPTION: Renders a cyan line between points (383, 212) and (99, 84).
; PLAN: r0=383(x1), r1=212(y1), r2=99(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 212
LDI r2, 99
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
