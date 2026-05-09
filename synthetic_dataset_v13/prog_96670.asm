; DESCRIPTION: Renders a cyan line between points (41, 94) and (80, 37).
; PLAN: r0=41(x1), r1=94(y1), r2=80(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 94
LDI r2, 80
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
