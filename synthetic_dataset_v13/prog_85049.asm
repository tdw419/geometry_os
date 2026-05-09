; DESCRIPTION: Renders a green line between points (66, 70) and (272, 121).
; PLAN: r0=66(x1), r1=70(y1), r2=272(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 70
LDI r2, 272
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
