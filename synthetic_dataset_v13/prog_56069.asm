; DESCRIPTION: Renders a cyan line between points (169, 10) and (473, 197).
; PLAN: r0=169(x1), r1=10(y1), r2=473(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 10
LDI r2, 473
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
