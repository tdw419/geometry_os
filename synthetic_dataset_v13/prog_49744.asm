; DESCRIPTION: Renders a yellow line between points (510, 192) and (100, 166).
; PLAN: r0=510(x1), r1=192(y1), r2=100(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 192
LDI r2, 100
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
