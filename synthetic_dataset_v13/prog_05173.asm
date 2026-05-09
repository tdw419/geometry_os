; DESCRIPTION: Renders a yellow line between points (240, 0) and (43, 86).
; PLAN: r0=240(x1), r1=0(y1), r2=43(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 0
LDI r2, 43
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
