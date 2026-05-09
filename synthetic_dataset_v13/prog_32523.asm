; DESCRIPTION: Draws a red line from (192, 129) to (399, 88).
; PLAN: r0=192(x1), r1=129(y1), r2=399(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 129
LDI r2, 399
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
