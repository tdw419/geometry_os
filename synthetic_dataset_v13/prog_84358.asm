; DESCRIPTION: Renders a red line between points (99, 9) and (129, 213).
; PLAN: r0=99(x1), r1=9(y1), r2=129(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 9
LDI r2, 129
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
