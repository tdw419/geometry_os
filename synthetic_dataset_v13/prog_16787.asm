; DESCRIPTION: Renders a yellow line between points (82, 222) and (77, 160).
; PLAN: r0=82(x1), r1=222(y1), r2=77(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 222
LDI r2, 77
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
