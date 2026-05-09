; DESCRIPTION: Renders a yellow line between points (380, 144) and (349, 40).
; PLAN: r0=380(x1), r1=144(y1), r2=349(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 144
LDI r2, 349
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
