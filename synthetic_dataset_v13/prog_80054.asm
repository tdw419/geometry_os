; DESCRIPTION: Renders a blue line between points (399, 6) and (165, 192).
; PLAN: r0=399(x1), r1=6(y1), r2=165(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 6
LDI r2, 165
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
