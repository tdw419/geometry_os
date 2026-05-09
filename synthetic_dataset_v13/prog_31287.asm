; DESCRIPTION: Renders a green line between points (6, 108) and (36, 12).
; PLAN: r0=6(x1), r1=108(y1), r2=36(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 108
LDI r2, 36
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
