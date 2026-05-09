; DESCRIPTION: Renders a cyan line between points (457, 210) and (144, 97).
; PLAN: r0=457(x1), r1=210(y1), r2=144(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 210
LDI r2, 144
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
