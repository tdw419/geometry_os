; DESCRIPTION: Renders a green line between points (309, 38) and (90, 13).
; PLAN: r0=309(x1), r1=38(y1), r2=90(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 38
LDI r2, 90
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
