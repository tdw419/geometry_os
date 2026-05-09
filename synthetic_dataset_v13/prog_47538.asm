; DESCRIPTION: Renders a yellow line between points (475, 205) and (288, 211).
; PLAN: r0=475(x1), r1=205(y1), r2=288(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 205
LDI r2, 288
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
