; DESCRIPTION: Renders a cyan line between points (363, 47) and (100, 198).
; PLAN: r0=363(x1), r1=47(y1), r2=100(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 47
LDI r2, 100
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
