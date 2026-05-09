; DESCRIPTION: Renders a cyan line between points (22, 97) and (129, 220).
; PLAN: r0=22(x1), r1=97(y1), r2=129(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 97
LDI r2, 129
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
