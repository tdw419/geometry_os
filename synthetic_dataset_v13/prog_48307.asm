; DESCRIPTION: Renders a cyan line between points (340, 49) and (302, 188).
; PLAN: r0=340(x1), r1=49(y1), r2=302(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 49
LDI r2, 302
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
