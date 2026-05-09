; DESCRIPTION: Renders a yellow line between points (177, 178) and (76, 192).
; PLAN: r0=177(x1), r1=178(y1), r2=76(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 178
LDI r2, 76
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
