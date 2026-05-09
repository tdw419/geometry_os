; DESCRIPTION: Renders a black line between points (50, 84) and (222, 27).
; PLAN: r0=50(x1), r1=84(y1), r2=222(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 84
LDI r2, 222
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
