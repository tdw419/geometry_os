; DESCRIPTION: Renders a cyan line between points (302, 210) and (323, 211).
; PLAN: r0=302(x1), r1=210(y1), r2=323(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 210
LDI r2, 323
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
