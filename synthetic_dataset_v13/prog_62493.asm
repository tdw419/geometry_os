; DESCRIPTION: Renders a cyan line between points (233, 97) and (259, 159).
; PLAN: r0=233(x1), r1=97(y1), r2=259(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 97
LDI r2, 259
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
