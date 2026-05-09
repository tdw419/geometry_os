; DESCRIPTION: Renders a cyan line between points (270, 121) and (438, 34).
; PLAN: r0=270(x1), r1=121(y1), r2=438(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 121
LDI r2, 438
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
