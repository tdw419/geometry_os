; DESCRIPTION: Renders a cyan line between points (270, 175) and (99, 170).
; PLAN: r0=270(x1), r1=175(y1), r2=99(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 175
LDI r2, 99
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
