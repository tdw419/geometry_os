; DESCRIPTION: Renders a cyan line between points (151, 178) and (149, 106).
; PLAN: r0=151(x1), r1=178(y1), r2=149(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 178
LDI r2, 149
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
