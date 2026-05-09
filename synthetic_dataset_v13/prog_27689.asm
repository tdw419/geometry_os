; DESCRIPTION: Renders a cyan line between points (183, 6) and (465, 78).
; PLAN: r0=183(x1), r1=6(y1), r2=465(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 6
LDI r2, 465
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
