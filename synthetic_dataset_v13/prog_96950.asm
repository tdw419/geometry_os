; DESCRIPTION: Renders a cyan line between points (363, 230) and (41, 248).
; PLAN: r0=363(x1), r1=230(y1), r2=41(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 230
LDI r2, 41
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
