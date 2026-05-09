; DESCRIPTION: Renders a yellow line between points (75, 169) and (307, 126).
; PLAN: r0=75(x1), r1=169(y1), r2=307(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 169
LDI r2, 307
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
