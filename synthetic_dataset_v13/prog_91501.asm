; DESCRIPTION: Renders a black line between points (218, 29) and (270, 167).
; PLAN: r0=218(x1), r1=29(y1), r2=270(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 29
LDI r2, 270
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
