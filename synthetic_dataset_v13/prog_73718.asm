; DESCRIPTION: Renders a white line between points (347, 129) and (377, 151).
; PLAN: r0=347(x1), r1=129(y1), r2=377(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 129
LDI r2, 377
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
