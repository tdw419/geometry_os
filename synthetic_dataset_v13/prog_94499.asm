; DESCRIPTION: Renders a red line between points (222, 129) and (66, 8).
; PLAN: r0=222(x1), r1=129(y1), r2=66(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 129
LDI r2, 66
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
