; DESCRIPTION: Renders a orange line between points (388, 210) and (179, 192).
; PLAN: r0=388(x1), r1=210(y1), r2=179(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 210
LDI r2, 179
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
