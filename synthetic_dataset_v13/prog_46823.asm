; DESCRIPTION: Renders a cyan line between points (473, 161) and (396, 94).
; PLAN: r0=473(x1), r1=161(y1), r2=396(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 161
LDI r2, 396
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
