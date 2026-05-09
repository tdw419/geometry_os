; DESCRIPTION: Renders a yellow line between points (247, 192) and (177, 246).
; PLAN: r0=247(x1), r1=192(y1), r2=177(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 192
LDI r2, 177
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
