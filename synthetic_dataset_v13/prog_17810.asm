; DESCRIPTION: Renders a cyan line between points (302, 89) and (123, 15).
; PLAN: r0=302(x1), r1=89(y1), r2=123(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 89
LDI r2, 123
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
