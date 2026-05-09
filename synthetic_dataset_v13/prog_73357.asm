; DESCRIPTION: Renders a green line between points (456, 132) and (44, 222).
; PLAN: r0=456(x1), r1=132(y1), r2=44(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 132
LDI r2, 44
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
