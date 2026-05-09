; DESCRIPTION: Renders a cyan line between points (1, 218) and (140, 105).
; PLAN: r0=1(x1), r1=218(y1), r2=140(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 218
LDI r2, 140
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
