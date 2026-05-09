; DESCRIPTION: Renders a yellow line between points (21, 34) and (268, 6).
; PLAN: r0=21(x1), r1=34(y1), r2=268(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 34
LDI r2, 268
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
