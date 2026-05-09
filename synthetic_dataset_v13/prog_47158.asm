; DESCRIPTION: Renders a cyan line between points (463, 57) and (416, 114).
; PLAN: r0=463(x1), r1=57(y1), r2=416(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 57
LDI r2, 416
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
