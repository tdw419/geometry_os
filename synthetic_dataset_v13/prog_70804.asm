; DESCRIPTION: Renders a yellow line between points (206, 105) and (167, 192).
; PLAN: r0=206(x1), r1=105(y1), r2=167(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 105
LDI r2, 167
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
