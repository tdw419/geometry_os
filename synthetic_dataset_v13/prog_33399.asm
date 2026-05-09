; DESCRIPTION: Renders a green line between points (406, 7) and (505, 52).
; PLAN: r0=406(x1), r1=7(y1), r2=505(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 7
LDI r2, 505
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
