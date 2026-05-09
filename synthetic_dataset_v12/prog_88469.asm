; DESCRIPTION: Renders a cyan line between points (438, 145) and (1, 100).
; PLAN: r0=438(x1), r1=145(y1), r2=1(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 145
LDI r2, 1
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
