; DESCRIPTION: Renders a yellow line between points (9, 137) and (146, 139).
; PLAN: r0=9(x1), r1=137(y1), r2=146(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 137
LDI r2, 146
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
