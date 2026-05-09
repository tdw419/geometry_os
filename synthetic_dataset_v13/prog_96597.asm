; DESCRIPTION: Renders a cyan line between points (302, 188) and (68, 52).
; PLAN: r0=302(x1), r1=188(y1), r2=68(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 188
LDI r2, 68
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
