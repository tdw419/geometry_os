; DESCRIPTION: Renders a cyan line between points (366, 151) and (80, 94).
; PLAN: r0=366(x1), r1=151(y1), r2=80(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 151
LDI r2, 80
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
