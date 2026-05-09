; DESCRIPTION: Renders a cyan line between points (194, 212) and (510, 22).
; PLAN: r0=194(x1), r1=212(y1), r2=510(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 212
LDI r2, 510
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
